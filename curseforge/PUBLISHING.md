# Publishing PandaQuest on CurseForge

The release workflow can upload the same zip the GitHub release carries. It does nothing until the
steps below are done, so merging it changes nothing for anybody.

## Before the first upload

1. **Decide the licence.** CurseForge asks for one, and this repository declares none. The embedded
   libraries and the pfQuest icons carry their own licences, but the quest database is built from
   Questie's data, and the Questie repository declares no licence file. Get that settled (ask the
   Questie maintainers, or regenerate the database from a source whose terms allow it) before the
   project goes public. This is a decision for the author, not something a script can resolve.
2. **Create the project** on CurseForge: game *World of Warcraft*, category *Addons*, game version
   *Mists of Pandaria Classic*.
3. **Summary** (one line, English): paste `curseforge/summary.txt`.
4. **Description**: paste `curseforge/description.md` (CurseForge renders Markdown).
5. **Avatar**: upload `assets/logo/panda-quest-400.png`. CurseForge's moderation policy asks for
   exactly 400x400 px and warns against WebP; the larger PNGs are for everything else.
6. **Screenshots**: the project page has a gallery and this repository has none, because they have
   to be taken in game: the arrow, the map pins, a node tooltip, the flight bar and the options
   panel are the five that explain the addon.
7. Put the project's numeric id in the TOC as `## X-Curse-Project-ID: <id>`. Do not add the line
   with a made-up number.

## Turn the upload on

In the repository settings (the upload then runs only when you start the *Release* workflow
by hand, on `main`):

| Where | Name | Value |
|---|---|---|
| Variables | `CURSEFORGE_PROJECT_ID` | the numeric project id |
| Secrets | `CF_API_TOKEN` | an API token from <https://authors.curseforge.com/account/api-tokens> |
| Variables (optional) | `CURSEFORGE_RELEASE_TYPE` | `alpha`, `beta` (default) or `release` |

Do **not** also link the repository through CurseForge's own automatic packaging: it would package
the repository root, not the `PandaQuest/` folder.

## What is checked, and what is not

`check.py` tests the upload script offline: the game version derived from `## Interface`
(`50504` → `5.5.4`), picking the game-version id by exact name, the metadata and the multipart body,
that the job is off without a project id and never has write permission, and that the summary is
one English line within the limit.

**Not verified:** a real upload. The name CurseForge gives Mists of Pandaria Classic 5.5.4 in its
game-version list has not been looked up against the live API; the script fails and prints what the
list contains rather than guessing. The first upload is the test — watch that run.

## TOC and multiple game versions

CurseForge's multi-TOC feature is for one addon that supports several game versions: each TOC file
is named after the addon folder (`PandaQuest.toc`, or `PandaQuest_Mists.toc` for a client-specific
one) and carries its own `## Interface`. PandaQuest targets only Mists of Pandaria Classic, so it
ships a single `PandaQuest.toc` with `## Interface: 50504`; CurseForge reads the game version from
that number.

## CurseForge's moderation policy, and where this repository meets it

(<https://support.curseforge.com/support/solutions/articles/9000197279-moderation-policies>)

| Rule | How it is met |
|---|---|
| Name in English, without the game name or a version | "PandaQuest" |
| Summary is one sentence and is not the description | `summary.txt` |
| Description explains functionality; English first, other languages after | `description.md`: English, then a short Finnish section |
| No external download links | the description links to the issue tracker and the portal, not to a release |
| Donation and personal links at the bottom | there are none; the source link is last |
| Avatar 400x400, not a solid colour | `panda-quest-400.png` |
| Third-party content permitted and credited | **open**: see "Before the first upload", point 1 |
| No file updates made to boost visibility; every update has a changelog | the upload job runs only when started by hand, and its changelog is the commits to `PandaQuest/` since the previous release |
