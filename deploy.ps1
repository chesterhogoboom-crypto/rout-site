# One-time publish of the Rout landing page to GitHub Pages (approved by Chester 2026-10-19).
$ErrorActionPreference = "Stop"
Set-Location C:\Users\chest\Documents\GitHub\rout-site
New-Item -ItemType File -Force -Path .nojekyll | Out-Null
"# Rout landing page`n`nStatic one-page site served by GitHub Pages. Edit index.html and push to main." | Set-Content README.md -Encoding UTF8
if (-not (Test-Path .git)) { git init -b main | Out-Null }
git add index.html README.md .nojekyll
git -c user.name="Chester Cody" -c user.email="cody.sagu@gmail.com" commit -m "Rout landing page: early-access page for small custom shops

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01HS7MWLwfGDS8WQwsKdK4yb" | Out-Null
gh repo create chesterhogoboom-crypto/rout-site --public --source=. --remote=origin --push --description "Rout - one email in, every file where it belongs. Landing page."
Start-Sleep -Seconds 3
gh api -X POST repos/chesterhogoboom-crypto/rout-site/pages -f "source[branch]=main" -f "source[path]=/" | Out-Null
Start-Sleep -Seconds 5
gh api repos/chesterhogoboom-crypto/rout-site/pages --jq ".html_url + \"  status=\" + (.status // \"pending\")"
