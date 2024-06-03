# TES3MP

**If you are interested in current OpenMW multiplayer development, please see
[Dreamweave-MP](https://gitlab.com/dreamweave-mp).**

## Purpose

- To collect some history about upstream TES3MP in case it may be useful to
  the OpenMW community
- To illustrate one small part of why some members of the OpenMW community
  have abandoned TES3MP
- To archive some contributions that were accepted and then discarded by
  upstream TES3MP (apparently as retaliation) by force-pushing the default
  `0.8.1` branch without the changes
- To archive some contributions that were not submitted at all due to previous
  contributions being discarded without any reason given
- To archive the legacy Dreamweave fork of TES3MP which has discarded in favor
  of a new OpenMW fork

## Branches

Among others, find the following branches in this repository:

- `about`: some history about upstream TES3MP
- `tes3mp-0.8.1-snapshot2`: snapshot of TES3MP `0.8.1` branch in which the
  license change was reverted with permission from contributors
- `tes3mp-0.8.1-vr-snapshot2`: snapshot of TES3MP `0.8.1-vr` branch in which
  the license change reverted with permission from contributors
- `dreamweave-legacy-master-snapshot`: snapshot of legacy Dreamweave which was
  based on TES3MP
- `master`: TES3MP contributions by backlabs1

## Timeline

*Dates are approximate.*

- 2021-04-18: David Cernat authored commit
  [f6887559f6](https://github.com/TES3MP/TES3MP/commit/f6887559f6baa2aa94847ee8341045ffeffdac8f)
  ([archive](https://web.archive.org/web/20220908105726/https://github.com/TES3MP/TES3MP/commit/f6887559f6baa2aa94847ee8341045ffeffdac8f)),
  which changed the TES3MP license from the standard GPLv3 used by OpenMW to a
  GNU GPLv3 license with [section
  7](https://www.gnu.org/licenses/gpl-3.0.en.html#section7) additional
  restrictions. There is no indication that permission for a license change
  was granted by OpenMW or TES3MP-specific copyright holders. The following
  GPLv3 section 7 requirement was not met: "If you add terms to a covered work
  in accord with this section, you must place, in the relevant source files, a
  statement of the additional terms that apply to those files, or a notice
  indicating where to find the applicable terms." Note it is impossible to
  know what license governs a particular line in a source archive, aside from
  "TES3MP" markers added for some of the changes.
- 2021-04-18 to 2022-05-01: Many changes were merged in from upstream
  [OpenMW](https://gitlab.com/OpenMW/openmw/) and from the [madsbuvi OpenMW VR
  fork](https://gitlab.com/madsbuvi/openmw), both of which are governed by the
  original GPLv3 without additional terms.
- 2022-03-06: David Cernat authored commit
  [cf4ff3513f](https://github.com/TES3MP/TES3MP/commit/cf4ff3513f25574c6c79377c09fe72e95c2ee069)
  ([archive](https://web.archive.org/web/20240513234432/https://github.com/TES3MP/TES3MP/commit/cf4ff3513f25574c6c79377c09fe72e95c2ee069)),
  which updated the license specified in the README (as "GPLv3 with additional
  allowed terms").
- 2023-11-01: David Cernat was given "Owner" role permissions in the [GitLab
  OpenMW group](https://gitlab.com/groups/OpenMW/-/group_members). There is
  not an archive of this but it was stated as occurring in approximately
  November or December of 2023 by a member of the community. This [archive
  from
  2022-06-02](https://web.archive.org/web/20220602054340/https://gitlab.com/groups/OpenMW/-/group_members)
  lists David Cernat with "Maintainer" role; there is no snapshot during the
  time when he was listed as "Owner".
- 2024-02-13 to 2024-04-15: backlabs1 opened four pull requests that were
  merged by David Cernat: [#675](https://github.com/TES3MP/TES3MP/pull/675)
  ([archived](https://web.archive.org/web/20240516040841/https://github.com/TES3MP/TES3MP/pull/675)),
  [#676](https://github.com/TES3MP/TES3MP/pull/676)
  ([archived](https://web.archive.org/web/20240516040606/https://github.com/TES3MP/TES3MP/pull/676)),
  [#677](https://github.com/TES3MP/TES3MP/pull/677)
  ([archived](https://web.archive.org/web/20240516040557/https://github.com/TES3MP/TES3MP/pull/677)),
  and [#683](https://github.com/TES3MP/TES3MP/pull/683)
  ([archived](https://web.archive.org/web/20240516040548/https://github.com/TES3MP/TES3MP/pull/683)). The
  first three of those can be found merged by David Cernat in the
  backlabs1/TES3MP [tes3mp-0.8.1-snapshot
  branch](https://github.com/backlabs1/TES3MP/commits/tes3mp-0.8.1-snapshot/)
  ([archived](https://web.archive.org/web/20240513235608/https://github.com/backlabs1/TES3MP/commits/tes3mp-0.8.1-snapshot/)).
- 2024-04-12: backlabs1 opened [TES3MP issue
  #685](https://github.com/TES3MP/TES3MP/issues/685)
  ([archive](https://web.archive.org/web/20240417051934/https://github.com/TES3MP/TES3MP/issues/685))
  for discussion regarding the license change. After some discussion (all of
  which is included in the archived version) the issue was abruptly
  deleted. Also, the four pull requests by backlabs1 (that were previously
  accepted and merged) were discarded and the default `0.8.1` branch was
  force-pushed without them.
- 2024-04-17: backlabs1 opened [OpenMW issue
  #7935](https://gitlab.com/OpenMW/openmw/-/issues/7935)
  ([archive](http://web.archive.org/web/20240418043925/https://gitlab.com/OpenMW/openmw/-/issues/7935)
  or see `2024-04-17_7935_0_backlabs1.md`). In the next approximately 14
  hours, the following comments and actions were posted publicly:
  - AnyOldName3 (see `2024-04-17_7935_1-1_AnyOldName3.md`)
    - backlabs1 (see `2024-04-17_7935_1-2_backlabs1.md`)
  - backlabs1 (see `2024-04-17_7935_2_backlabs1.md`)
  - backlabs1 (see `2024-04-17_7935_3_backlabs1.md`)
  - David Cernat (see `2024-04-17_7935_4-1_David-Cernat.md`)
    - Chris Robinson (see `2024-04-17_7935_4-2_Chris-Robinson.md`)
      - David Cernat (see `2024-04-17_7935_4-3_David-Cernat.md`)
  - "Issue was closed by David Cernat" notification dated 2024-04-18 07:47:10
    UTC
  - "Issue was reopened by uramer" notification dated 2024-04-18 13:15:27 UTC
  - Then the issue was deleted.
- 2024-04-17: backlabs1 opened Dreamweave issue #89
  ([archive](https://web.archive.org/web/20240418190203/https://github.com/DreamWeave-MP/Dreamweave/issues/89)).
- 2024-04-18: backlabs1 sent a private message to the following [GitLab OpenMW
  group](https://gitlab.com/groups/OpenMW/-/group_members) members who at that
  time had either an "Owner" or a "Maintainer" role, excluding David Cernat:
  psi29a, Marc Zinnschlag (@zinnschlag), AnyOldName3, Anton Uramer (@uramer),
  Chris Robinson (@chriskcat), Pieter van der Kloet (@pvdk), and @jvoisin. See
  `2024-04-18_email.txt`. From that date to 2024-05-10, backlabs1 received a
  total of five replies from three of the recipients.
- 2024-04-19: David Cernat was removed from the [GitLab OpenMW
  group](https://gitlab.com/groups/OpenMW/-/group_members)
  ([archive](https://web.archive.org/web/20240513233448/https://gitlab.com/groups/OpenMW/-/group_members)).
- 2024-04-20: psi29a opened and locked [OpenMW issue
  #7937](https://gitlab.com/OpenMW/openmw/-/issues/7937)
  ([archive](https://web.archive.org/web/20240421211013/https://gitlab.com/OpenMW/openmw/-/issues/7937))
  in which he stated, "David has apologized and is willing to revert the
  commits that changed the licensing of TES3MP as the threat of a hostile fork
  from 2018 has long since passed."
- 2024-05-10: David Cernat authored and pushed two commits changing the
  license back to the "regular GPLv3 license without additional terms",
  stating that the "change has been made with the explicit permission of the
  following people who contributed code after the additional terms had been
  added: GrimKriegor, nalal, madsbuvi, sidke, magicaldave, HotaruBlaze,
  trofi." The commits are
  [90a5333485](https://web.archive.org/web/20240513214930/https://github.com/TES3MP/TES3MP/commit/90a53334853ca103e13a9f42b0016816d807a844)
  (on the `0.8.1` branch) and
  [2344ac1c7a](https://web.archive.org/web/20240513232200/https://github.com/TES3MP/TES3MP/commit/2344ac1c7a2a0f31c753dcc47c6e35bebfe288f3)
  (on the `0.8.1-vr` branch). See also the archived [0.8.1
  commits](https://web.archive.org/web/20240513232120/https://github.com/TES3MP/TES3MP/commits/0.8.1/)
  and [0.8.1-vr
  commits](https://web.archive.org/web/20240513232115/https://github.com/TES3MP/TES3MP/commits/0.8.1-vr/).
- 2024-05-13: psi29a posted to [OpenMW issue
  #7937](https://gitlab.com/OpenMW/openmw/-/issues/7937)
  ([archive](https://web.archive.org/web/20240513214819/https://gitlab.com/OpenMW/openmw/-/issues/7937))
  stating "Mr. Kuhn said he would follow up with a more formal response that
  can be considered the guidance/support of the [Software Freedom
  Conservancy](https://sfconservancy.org/)" and then edited the post to add a
  preliminary conclusion regarding the legal guidance received.
- 2024-05-14: David Cernat removed the two commits from the `0.8.1` and
  `0.8.1-vr` branches and force-pushed to those branches without the commits
  from 2024-05-10. See the archived [0.8.1
  commits](https://web.archive.org/web/20240514164933/https://github.com/TES3MP/TES3MP/commits/0.8.1/)
  and the [0.8.1-vr
  commits](https://web.archive.org/web/20240514165413/https://github.com/TES3MP/TES3MP/commits/0.8.1-vr/),
  in both of which the license change revert commit is now missing.
- 2024-05-24: backlabs1 sent a private message to the same recipients as the
  message on 2024-04-18. See `2024-05-24_email.txt` (one quote from a private
  reply is redacted).
- 2024-06-02: To this date, there has been no update from [Bradley
  M. Kuhn](https://ebb.org/bkuhn/) on [OpenMW issue
  #7937](https://gitlab.com/OpenMW/openmw/-/issues/7937)
  ([archive](https://web.archive.org/web/20240603043956/https://gitlab.com/OpenMW/openmw/-/issues/7937))
  and no reply to the message on 2024-05-24.

## Legal

Copyright 2024 backlabs1. [Creative Commons
Attribution-NonCommercial-ShareAlike 4.0
International](https://creativecommons.org/licenses/by-nc-sa/4.0/).

Included quotes are copyright their respective owners.

Files in other branches may be governed by other licenses.
