# [Create A Custom Git Commit Template](https://medium.com/@alex.wasik/create-a-custom-git-commit-template-84468232a459)
by [Alex Wasik](https://medium.com/@alex.wasik?source=post_page-----84468232a459----------------------)

---
###### tags: `Dev` `Article` `DevOps`
---

**TL;DR Create custom git commit template so you can have great commit messages. Bad commit messages are bad.**

Whether you are working on a team, working alone or coming into a new company’s app, commit messages provide insight into what changed and why. Or… at least they should. Let’s be honest; Most of us have been guilty of this:

```shell
git commit -m 'fixed it!' 🤦‍♀
```

Unfortunately, this doesn’t help anyone know what was fixed. A custom commit template can help ensure good commit detail by forcing you to follow a structured outline. Answering why the commit was created, what changes were made and any other pertinent information and/or notes that would benefit someone revisiting the commit later makes for a good commit message.

A great write-up of why you should write good commit messages can be found [here](https://medium.com/compass-true-north/writing-good-commit-messages-fc33af9d6321).


Setting up a custom commit template is pretty easy.


First, we will need to edit our `.gitconfig` file to point git to the template we are creating. We are creating the template in the file `.gitmessage` in the root folder, but you can use any file name in any location you choose. There are two options to edit `.gitconfig`, via the command line or manually in your editor.


Command line:

```shell
git config --global commit.template ~/.gitmessage
```

You can leave out the `--global` flag if you only plan on using this template for a single, individual repo.

When you open the file in your editor, it should now have this at the bottom. If you chose not to run the above command, you can manually add this, with the `~/.gitmessage` being the reference to the file where the template will live.

```shell
[commit]
  template = ~/.gitmessage
```

Back at the command line, create and open the file for the template. Substitute `code` with whatever command you use as your editor. `vim`, `vi`, `subl`, `emacs`, etc.

```shell
code ~/.gitmessage
```

Below is a sample template, but you can customize it to fit your needs or personality.

    ######## 50 characters ############################
    Subject
    ######## 72 characters ############################
    Problem
    
    # Problem, Task, Reason for Commit
    Solution

    # Solution or List of Changes
    Note
    # Special instructions, testing steps, rake, etc

- The subject should describe the commit in 50 characters or less.
- The line length in the body should be no more than (or word-wrapped at) 72 characters.
- Breaking up the body into multiple sections allows you to provide useful context of the commit and changes made.

The `#` are ignored by git, so the completed output would look something like:

    BUGFIX: Add New Column For User First Name

    Problem
    We do not have a column for first name. We need this column for reporting.
    
    Solution
    * Add column migration
    * Create task to populate new column
    * Update user view
    
    Note
    Merge after 6pm EST

Now when you commit your fresh updates, only type `git commit`. Your template will pop up in your editor and you can provide clear context of the commit.

You can still bypass the template with `git commit -m <your_message_here>` for cases when you truly need it, but for all other cases you have a detailed outline for future commits.
Future You will thank you.

For more in-depth details on customizing git: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration
