# [Top 10 GitHub best practices for developers](https://datree.io/github-best-practices/)
by [Eyar Zilberman](https://datree.io/author/eyar/)

---
###### tags: `Dev` `Article` `DevOps`
---

## How we created this GitHub best practices list
We interviewed hundreds of software developers, and perfomed code scanning on thousands of GitHub repositories using [our own product](https://datree.io/) to produce this list.

These best practices are still applicable even if you use something other than GitHub for version control or source control, because they’re all about ensuring source code security and writing good code.

## # 9 – Don’t just git commit directly to master
Regardless if you use [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/) or any other git branching model, it is always a good idea to turn on [git branch protection](https://help.github.com/articles/configuring-protected-branches/) to prevent direct commits and ensure your main branch code is deployable at all times. All commits should be managed via pull requests.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/github-branch-protection.gif" alt="Git branch protection" style="display: block; margin: auto;" />

## # 8 – Do git commit with the right email address
Sometimes you commit code using the wrong email address, and as a result GitHub shows that your commit has an [unrecognized author](https://help.github.com/articles/why-are-my-commits-linked-to-the-wrong-user/). Having commits with unrecognized authors makes it more difficult to track who wrote which part of the code.

Ensure your Git client is [configured](https://help.github.com/articles/setting-your-commit-email-address-in-git/) with the correct email address and linked to your GitHub user. Check your pull requests during code reviews for unrecognized commits.

<img src="https://4aeano3if3ta18bjvc3h8p13-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/unrecognized-commits.jpg" alt="Unrecognized commits" style="display: block; margin: auto;" />

## # 7 – Define code owners for faster code reviews
When you’re dealing with dozens, hundreds, or more repositories and engineers, it’s nearly impossible to know who owns which parts of the codebase and need to review your changes.

Even in smaller teams you’d still have code owners – for example, front-end code changes should be reviewed by the Front-End Engineer.

Use [Code Owners](https://help.github.com/articles/about-codeowners/) feature to define which teams and people are automatically selected as reviewers for the repository.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/github-code-owners-datree.png" alt="Code owners" style="display: block; margin: auto;" />

## # 6 – Don’t let secrets leak into source code
Secrets, or secret keys or secret credentials, include things like account passwords, API keys, private tokens, and SSH keys. You should not check them into your source code.

Instead, we recommend you inject secrets as environment variables externally from a secure store. You can use tools like Hashicorp [Vault](https://www.vaultproject.io/) or [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) to do this.

There are also tools for scanning secrets in repos and prevent them from getting into repos.
- [Git-secrets](https://github.com/awslabs/git-secrets) can help you to identify passwords in your code.
- [Git hooks](https://githooks.com/) can be used to build a pre-commit hook and check every pull request for secrets.
- Datree has a built-in [policy rule](https://docs.datree.io/docs/do-not-include-secret-files) for this.

Read this [tutorial](https://datree.io/secrets-management-aws/) or watch this [video](https://pages.datree.io/managing-secrets-in-git) for a more detailed explanation on why you should manage secrets this way and how to do it right.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/github-secrets-in-code-datree.png" alt="Git secrets" style="display: block; margin: auto;" />

## # 5 – Don’t commit dependencies into source code
Pushing dependencies into your remote origin will increase repository size. Remove any projects dependencies included in your repositories and let your package manager download them in each build. if you are afraid of “dependencies availability” you should consider using a binary repository manager solution like [Jfrog](https://jfrog.com/) or [Nexus Repository](https://www.sonatype.com/nexus-repository-sonatype). Or check out GitHub’s [Git-Sizer](https://github.com/github/git-sizer).

## # 4 – Don’t commit configuration files into source code
We strongly recommend against committing your local config files to version control. Usually, those are private configuration files you don’t want to push to remote because they are holding secrets, personal preferences, history or general information that should stay only in your local environment.

## # 3 – Create a meaningful git ignore file
A .gitignore file is a must in each repository to ignore predefined files and directories. It will help you to prevent secret keys, dependencies and many other possible discrepancies in your code. You can choose a relevant template from [Gitignore.io](https://www.gitignore.io/) to get started quickly.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/gitignore.gif" alt="Gitignore" style="display: block; margin: auto;" />

## # 2 – Archive dead repositories
Over time, for various reasons, we find ourselves with unmaintained repositories. Sometimes developers create repos for an ad hoc use case, a POC, or some other reason. Sometimes they inherit repos with old and irrelevant code.

In any case, these repos were left intact. No one is doing any development work in those repos anymore, so you want to clean them up and avoid the risk of other people using them. The best practice is to archive them, i.e. make them “read-only” to everyone.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/github-archive-repo.gif" alt="GitHub archive repository" style="display: block; margin: auto;" />

## # 1 – Lock package version
Your manifest file contains information about all packages and dependencies in your project and their versions. The best practice is to specify a version or version range for every package and dependency listed in the manifest. Otherwise, you can’t be sure which version will get installed during the next build, and consequently your code may break.

<img src="http://datree.wpengine.com/wp-content/uploads/2018/10/koa-latest-version.gif" alt="Latest version" style="display: block; margin: auto;" />

## # 0 – Align packages versioning
Even when everyone on your team are using the same packages, reusing code and tests across different projects can still be difficult if the packages are of different versions.

If you have a package that is used in multiple projects, try at a minimum to use the same major version of the package.

<img src="https://4aeano3if3ta18bjvc3h8p13-wpengine.netdna-ssl.com/wp-content/uploads/2018/10/github-version-distribution-datree-catalog.jpg" alt="Version distribution" style="display: block; margin: auto;" />
