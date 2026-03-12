#!/usr/bin/env python3
from __future__ import annotations
import argparse
import json
import time
import urllib.error
import urllib.request
from pathlib import Path

PAYLOAD = Path("scripts/github_issue_payloads.json")
RUN_LOG = Path("docs/github_issue_creation_run_log.json")


def request_json(url: str, method: str = "GET", token: str | None = None, payload: dict | None = None):
    data = None
    headers = {
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "yoked-issue-backfill-script",
    }
    if token:
        headers["Authorization"] = f"Bearer {token}"
    if payload is not None:
        data = json.dumps(payload).encode("utf-8")
        headers["Content-Type"] = "application/json"
    req = urllib.request.Request(url=url, method=method, data=data, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            body = resp.read().decode("utf-8")
            return resp.status, json.loads(body) if body else {}
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8") if e.fp else ""
        raise RuntimeError(f"HTTP {e.code} for {method} {url}: {body}") from e


def list_all_issues(repo: str, token: str):
    all_issues = []
    page = 1
    while True:
        url = f"https://api.github.com/repos/{repo}/issues?state=all&per_page=100&page={page}"
        _, data = request_json(url, token=token)
        if not data:
            break
        all_issues.extend(data)
        if len(data) < 100:
            break
        page += 1
    return all_issues


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--token", required=True)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    payload = json.loads(PAYLOAD.read_text())
    repo = payload["repo"]
    issues = payload["issues"]

    existing = list_all_issues(repo, args.token)
    title_map = {i.get("title", ""): i for i in existing if "pull_request" not in i}

    run = {"repo": repo, "results": []}

    for item in issues:
        prefix = f"{item['ticket_id']} "
        matched = [i for t, i in title_map.items() if t.startswith(prefix)]
        labels = [item["kind"], item["priority"], *item["areas"]]
        if matched:
            i = matched[0]
            run["results"].append({
                "ticket_id": item["ticket_id"],
                "status": "already-existed",
                "number": i["number"],
                "url": i["html_url"],
                "labels_expected": labels,
            })
            continue

        if args.dry_run:
            run["results"].append({"ticket_id": item["ticket_id"], "status": "would-create"})
            continue

        create_payload = {"title": item["issue_title"], "body": item["body"], "labels": labels}
        _, created = request_json(
            f"https://api.github.com/repos/{repo}/issues",
            method="POST",
            token=args.token,
            payload=create_payload,
        )
        run["results"].append({
            "ticket_id": item["ticket_id"],
            "status": "created",
            "number": created["number"],
            "url": created["html_url"],
        })
        time.sleep(0.2)

    RUN_LOG.write_text(json.dumps(run, indent=2) + "\n")
    print(f"Wrote {RUN_LOG}")


if __name__ == "__main__":
    main()
