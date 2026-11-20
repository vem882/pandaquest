#!/usr/bin/env bash
set -euo pipefail
core=vem882/pandaquest
workflow=publish-curseforge.yml
ref=main
main_workflow=$(gh api "repos/$core/contents/.github/workflows/$workflow?ref=main" --jq .content | base64 -d)
if [[ "$main_workflow" != *'component:'* ]]; then
  ref=codex/component-release
fi
for spec in pqDB:database pqAuction:auction; do
    repo=${spec%:*}
    component=${spec#*:}
    tag=$(gh release view -R "vem882/$repo" --json tagName --jq .tagName)
    if ! [[ "$tag" =~ ^v[0-9]+(\.[0-9]+)+$ ]]; then
        echo "$repo has no stable version to publish"
        continue
    fi
    rc=0
    git ls-remote --exit-code --tags "https://github.com/$core.git"         "refs/tags/curseforge/$component/$tag" >/dev/null || rc=$?
    case "$rc" in
      0) continue ;;
      2) ;;
      *) exit "$rc" ;;
    esac
    echo "Sending $repo $tag to CurseForge"
    gh workflow run "$workflow" -R "$core" --ref "$ref" -f "release_tag=$tag" -f "component=$component"
done
