# [4 Simple Tricks to Avoid Merge Conflicts](https://team-coder.com/avoid-merge-conflicts/)
by [Robert Ecker](https://team-coder.com/author/packatino/)

---
###### tags: `Dev` `Article` `DevOps`
---

[Git](https://git-scm.com/) is a great tool if you have multiple developers working on the same code base. However, there is one thing which can be very annoying if your team uses Git: _Merge conflicts_! Two developers have changed the same part of the code and then Git doesn’t know what to do. Fortunately, there are a few tricks to avoid merge conflicts and this article will tell you how!

## Trick #1: Short-Living Branches
Many big merge conflicts are results of long-living branches. If you work in your own branch for several days, or even weeks, the risk is high that someone else changes parts of the code you have touched in another branch. That would lead to merge conflicts. On the other hand, if you have a short-living branch, meaning it is merged back into the trunk or master branch after a few hours, there will probably be no merge conflict. Even if there is a conflict, it can usually be resolved very quickly because there is much less code to think about.

The following figures both show a master branch (the line in the middle) and some kind of feature branches. The difference between those figures is that the first one contains many short-living branches while the second one has only two long-living feature branches. The merge commits in the first figure are always green because the short branches have not caused any merge conflicts. In the second figure we have a red dot at the end which represents a merge conflict that was caused by two of the many commits in the long-living branches.

<img src="https://team-coder.com/wp-content/uploads/ShortLivingBranches.png" style="display: block; margin: auto;">
<img src="https://team-coder.com/wp-content/uploads/LongLivingBranches.png" style="display: block; margin: auto;">

## Trick #2: Small Modules
The _Single Responsibility Principle_ (which is part of the [SOLID principles of software design](https://team-coder.com/solid-principles/)) says that “_a class should have one, and only one, reason to change_“. If we take this approach serious, there should never be a situation in which two developers change the same code at the same time because that would mean they are working on the same task. You see, a modular architecture and small classes do not only help to increase the quality of the code design but also decrease the chance for merge conflicts.

<img src="https://team-coder.com/wp-content/uploads/Documents.png" style="display: block; margin: auto;">

## Trick #3: Strong Communication
“Communication is the key” – We have heard this phrase so many times… and it’s true! If all your team mates know what you are working on and which parts of the code you are touching they will try not to change the same code at the same time. If another developer wants to change a part of the code base which you are working on then it would probably be a good idea to work together which leads me to the fourth trick…

<img src="https://team-coder.com/wp-content/uploads/Communication.png" style="display: block; margin: auto;">

## Trick #4: Mob Programming
This trick is the most powerful of all because it can eliminate merge conflicts completely! [Mob Programming](https://team-coder.com/mob-programming/) means that the whole team is working together on the same computer. That makes merge conflicts impossible because the whole mob is working on the same branch.

<img src="https://team-coder.com/wp-content/uploads/MobProgramming.png" style="display: block; margin: auto;">

This is how branching would typically look like with Mob Programming:

<img src="https://team-coder.com/wp-content/uploads/MobProgrammingBranch.png" style="display: block; margin: auto;">
