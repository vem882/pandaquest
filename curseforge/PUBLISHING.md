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
5. **Logo**: upload `assets/logo/panda-quest-512.png` (`-1024.png` for a larger avatar).
6. **Screenshots**: the project page has a gallery and this repository has none, because they have
   to be taken in game: the arrow, the map pins, a node tooltip, the flight bar and the options
   panel are the five that explain the addon.
7. Put the project's numeric id in the TOC as `## X-Curse-Project-ID: <id>`. Do not add the line
   with a made-up number.

## Turn the upload on

In the repository settings:

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
