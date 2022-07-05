# [Code Review Best Practices](https://youtu.be/EjwD7Pi7J_0)
[Posted on August 30, 2018 by Trisha Gee](https://blog.jetbrains.com/upsource/2018/08/30/code-review-best-practices/)

---
###### tags: `Dev` `Article`
---

We’ve created a new screencast outlining some of the best practices that apply to performing code reviews, and how Upsource can help apply those best practices. In this blog post we’ve also transcribed the content, and have provided links to further information.

## 1. Automate everything

[starts at 0:05 in video](https://youtu.be/EjwD7Pi7J_0?t=5s)

Firstly it’s important to automate as much as possible. It’s best to save the valuable time of your human reviewers by using tools such as continuous integration servers like [TeamCity](https://www.jetbrains.com/teamcity/) to ensure the build compiles and automated tests pass. Upsource supports integration with other tools, it can do things like show the results of a build for each commit, so it’s easy to see there’s no need to review commits where the build failed.

Code reviewers should never have to worry about whether code compiles or passes easily automated criteria. [Upsource provides code intelligence](https://www.jetbrains.com/help/upsource/creating-a-project-code-intelligence.html) for Java, Kotlin, JavaScript, PHP and Python. This means that when a reviewer is looking at code in Upsource they can see red or yellow warnings if the automated inspections find problems in the code. [Upsource also integrates with external inspection tools](https://www.jetbrains.com/help/upsource/external-inspections-support.html) like SonarQube.

As well as integration with build servers, Upsource also integrates issue trackers, like Jira and YouTrack, so it’s easy to navigate to the issue containing the details of what these changes are supposed to achieve.

Upsource also lets us [automate a lot of our code review workflow](https://blog.jetbrains.com/upsource/2017/04/13/automating-your-code-review-workflow-with-upsource/), for example creating reviews and assigning people to them.

## 2. Agree on Code Review Goals

[starts at 1:02 in video](https://youtu.be/EjwD7Pi7J_0?t=1m2s)

If we’ve automated as much as possible to determine the quality of our code, we need to decide what’s valuable for our human code reviewers to be looking.  Even taking away the checks that can be easily automated, like compilation, formatting, unit and system testing, there are still [many different aspects of the code that a reviewer could be looking at](https://blog.jetbrains.com/upsource/2015/07/23/what-to-look-for-in-a-code-review/). Selecting the important ones to check will depend upon the team and [how and when they review code](https://blog.jetbrains.com/upsource/tag/code-review-workflows/).  For example, reviewing the design of a large feature right at the end of the feature implementation is either too late to make changes or could significantly delay the release of that feature.

The goals for the team might be to:

- Make sure multiple members of the team understand this new piece of code
- Check the design follows the application’s standards
- Ensure the quality of the code. This should involve not only checking the presence of automated tests, but also whether the tests are testing the right things
- Identify potential security issues
- Use code reviews to collaborate early to find the right approach or design, and iterate over the development.

Whatever the goals are, the team needs to identify them early and apply them consistently. Note that many goals may be mutually exclusive, so it’s not possible to check for everything in every code review.

## 3. Submitting for Review

[starts at 2:15 in video](https://youtu.be/EjwD7Pi7J_0?t=2m15s)

Assuming the team has a set of goals for code reviews, a developer is going to want to submit their code for review.

Upsource lets a code author [create several types of reviews](https://www.jetbrains.com/help/upsource/codereview-author.html) manually, and can even [automate the creation of reviews](https://www.jetbrains.com/help/upsource/custom-workflows.html).  A developer can choose to [add a commit to an existing review](https://www.jetbrains.com/help/upsource/codereview-author.html#AddRevisions), to create a new review from a single commit, or to create a [review that tracks a whole branch](https://www.jetbrains.com/help/upsource/review-branches.html) – this last option will automatically add all new commits on this branch to this review.

We need to [select reviewers](https://www.jetbrains.com/help/upsource/codereview-author.html#Invite) for this review based on whatever our team guidelines are. This is going to depend upon the goals of the review – if the goal of the review is to pass some sort of gateway or quality check, there’s likely to be an individual or [group](https://www.jetbrains.com/help/upsource/creating-managing-groups.html) of specialists who should check the code. If the goal is to share the details of the implementation with the team, the reviewers could probably be anyone, or maybe even everyone, on the team. You can also select watchers, which suggests that these people should be aware of these code changes but are not required to comment on them.

Upsource can make the selection of reviewers easier. You can configure Upsource to [automatically add reviewers or groups of reviewers](https://www.jetbrains.com/help/upsource/custom-workflows.html) based on certain criteria, such as the type of review and the author of the code.  Upsource can also automatically suggest reviewers based on past review history.

Code authors can help reviewers to understand the code and the decisions taken while writing it by annotating it with [comments](https://www.jetbrains.com/help/upsource/discussion-comments.html). Note that by leaving comments in Upsource, rather than the code, the comments are potentially short-lived. The intention is that they only live during the review period, and their purpose is specifically for helping reviewer understanding. Although we’ll see later that c[omments in Upsource can live outside of the context of a review](https://www.jetbrains.com/help/upsource/comment-without-review.html), as a code author we’ll generally use them to communicate our thoughts to a reviewer.

It’s good practice to also [label](https://www.jetbrains.com/help/upsource/discussion-labels.html) the comments so it’s clearer what purpose the comment serves.  We’ll see more of this later.

## 4. Reviewing Code

[starts at 4:09 in video](https://youtu.be/EjwD7Pi7J_0?t=4m9s)

Now let’s look at best practices for reviewing code. The most important thing for a reviewer is to review the code as quickly as possible. The code author is likely to be waiting for the results of the review, and the longer it takes to receive feedback the harder it will be to remember the context of the changes.

Upsource shows the reviewer whether these revisions pass the automated build, so if this is green it’s reasonable to assume we can go ahead and review the code.

The issue tracker integration here lets us see at a glance the summary of the bug or feature being addressed by these code changes. This helps us as a reviewer see what problem the code is trying to fix, and reminds us to check whether the end result is what was actually needed.

Upsource also shows us whether the code author is online right now, if they are it’s probably a good time to review the code as it’s more likely that the author will respond quickly to any questions or comments.

We can use [reactions](https://www.jetbrains.com/help/upsource/discussion-comments.html#discussion_options) in response to someone else’s comments as a shortcut to show we’ve read them and understand or agree (or not).

We should be writing our own comments about the code near the relevant sections of code. Feedback should be constructive and comments should be about the code, not personal about the author.

It’s important that a reviewer labels each of their comments with the relevant tag, so the code author can easily see if this comment is a showstopper, a question that needs answering or maybe a nice-to-have, otherwise an author may be unclear about what to do to address the comment, or if it even needs to be addressed.

Code reviews can be difficult for code authors, as we developers can be attached to our code. It’s a nice idea to also leave positive feedback on the reviews as well as noting changes that need to be made. This might not seem like an important step in terms of getting great code out of the review, but it is an important step in order to motivate developers and perhaps overcome some of the fear or dislike that some people feel towards code reviews.

We may also decide to come back to some of the changes later for whatever reason, a good way to help us to remember where we were and best represent our progress is to mark a file as unread if we mean to return to it.

## 5. Iterating

[starts at 5:50 in video](https://youtu.be/EjwD7Pi7J_0?t=5m50s)

Code reviews are naturally iterative, even the best code should elicit comments to be read.  Upsource shows us what state our review is in, in this case it’s “Open” which means the reviewers are still in the process of checking the code.

As the code author, may want to use Upsource’s [progress view](https://www.jetbrains.com/help/upsource/codereview-author.html#ReviewProgress) to see how much of our code a reviewer has checked. We can also see whether the reviewer is currently online, and if so this is probably a good time to ping them directly via a review-level comment to ask them politely if they can finish the review so we can make any required changes.

When as a reviewer we’ve finished checking all the changes, it’s good practice to [indicate that we’ve made all the comments we’re going to make](https://www.jetbrains.com/help/upsource/codereview-reviewer.html#complete). In Upsource, we do this by Accepting the review, if we’re happy with the code as it is and don’t require any more changes, or Raising a Concern, which means that as a reviewer, we expect the author to answer our comments and possibly make changes to the code.

Upsource [shows the results for each reviewer](https://www.jetbrains.com/help/upsource/codereview-author.html#ReviewResolution), with either a purple face for those who’ve raised concerns, or a green smiley face on the icons of those who’ve accepted the review.

As a code author, if there are concerns that need addressing we should fix these as soon as possible, in the same way that reviewers should review code as soon as possible.  While it can be painful to context switch between tasks that one may be working on and another task like a code review, it’s less painful if there is less time between iterations of the review, it’s easier to remember the context if there isn’t a span of days or even weeks between writing the code and making changes.

If a review is based on a branch, as soon as we’ve committed a new change to the branch it’s automatically added to the review, and, of course, our build server compiles and tests the code once it’s checked in.

To make it easier to see which comments are still relevant or outstanding, it’s a good idea for the person who started a discussion to [resolve it](https://www.jetbrains.com/help/upsource/discussion-comments.html#discussion_options) when there’s no further action to take. So in this example, as we’re the code author and we can see that the reviewer has read our explanation comments, we can now mark those as resolved.  To show only the outstanding discussions we can then [hide the resolved discussions](https://www.jetbrains.com/help/upsource/codereview-reviewer.html#Examine) from the review, or even filter by label.

When we change code in a review, we should respond to the comments the reviewer made. We can either write full responses or use a reaction to acknowledge the point. We should also resolve any discussions we started that don’t need further action.

Once again, it’s a nice idea to annotate the code with comments, questions or ideas so the reviewer understands the thought that went into the code, or maybe to ask for suggestions.

When changes have been made to the code in a review, we can look at it again as the reviewer.  Adding new code to the review resets the state for the reviewers, so they have to once again select whether the code is Accepted or if they’ve Raised a Concern.  Upsource also resets any files that have been changed to Unread status, so as a reviewer we know that we only need to look at the files that are unread, all the other files as the same as last time we looked at them.

When we’ve resolved discussions that don’t need further action, and we don’t have any other outstanding issues with the code, we can accept the review.

## 6. Closing the Review

[starts at 9:13 in video](https://youtu.be/EjwD7Pi7J_0?t=9m13s)

Probably the most important part of the review is understanding that when code is good to go and closing it. Without this step, the code the author has worked so hard on is living in limbo and not delivering any value to anyone.  Once again, it’s important the team has decided in advance the criteria under which all reviews are considered closed – should it be when all reviewers have accepted it, or some subset? If it’s a subset of reviewers, is it important which individuals accept, or is it purely a number, for example at least 2 out of 3 reviewers? And what do you do if one or more reviewers have raised concerns, do they all need to be addressed, or can some reviewers be overridden by experts or by a majority?

Whatever your team decides, these standards should be applied consistently across all reviews.  Upsource is flexible enough to allow any reviewer or author to close a review whenever they want to, which means it’s down to them to apply the rules decided by the team.

Once a review is closed, this is probably the time to merge or publish our changes – again it’s up to the team to decide when this is done and by whom.  If the project uses Upsource’s integration with GitHub, the code can be [merged via Upsource itself](https://www.jetbrains.com/help/upsource/synchronizing-your-activities-in-github-projects.html#Pull%20requests%20and%20merges).

Closing a review doesn’t necessarily mean that all the discussions go away.  Discussions that have not been resolved live on in the code, so if we come across this code later we can see these unresolved comments, and it might be at that time that we do something about them. For example, we can use them to track possible tech debt or potential refactoring.

## In Summary

[starts at 10:34 in video](https://youtu.be/EjwD7Pi7J_0?t=10m34s)

We’ve looked at some best practices for code review and how to apply those inside Upsource.

It’s important to automate as much as possible.  Ideally your code review tool will show you the results of automation performed using other tools, such as a build server. Upsource also provides the ability to automate a lot of the code review workflow, and also has code intelligence for Java, Kotlin, JavaScript, PHP and Python so code reviewers can focus on the things only human reviewers can do.

The team needs to understand what’s the purpose of their code reviews, and apply standards consistently across all the reviews.  This might mean having a checklist of things to look for in reviews or it might be a set of rough guidelines. It also means knowing who is responsible for reviewing code in which sections of the application, and stating how it’s decided that a code review is complete and the code can be merged or published.

During the review it’s important to respond in a timely fashions as both a reviewer and an author, to minimise the cost of the context switch between whatever they’re working on and the code under review.

It’s also important as a reviewer to be clear about what you expect the code author to do in response to comments – should the code be changed or is it merely a comment to learn from and apply in the future?

Most importantly of all, the goal of a code review is to have the code pass the review, and make it into production. Code under review is usually code that’s not being used, and code that’s not being used is not adding any value to the application or the users.
