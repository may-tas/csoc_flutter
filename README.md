# CSOC'24 Flutter

CSOC'24 Project in App Dev track using Flutter.
This app is currently in its initial phase. Suggest your project ideas to work on, the following 4 weeks in [issue#1](https://github.com/Varun-Kolanu/csoc_flutter/issues/1) as comments.

## Setting up the development environment

### Pre-requisites

1. Git installed in system
2. Flutter installed

If any of the above is missing, please follow these links: [Installing Git](https://github.com/git-guides/install-git) and [Setting up flutter guide](https://www.notion.so/CSOC-24-Flutter-b407f567205540f0984f54b1c02bd1e6#5a8bdb1ba80d4901ab8fd4f0e811587a).

### Steps

1. Fork this repo.
2. Clone the forked repo into your local system with this command:

   ```bash
   git clone <your_forked_repo_url>
   ```

3. Open the cloned repo in VS Code terminal.
4. Check whether upstream is set successfully by running:
   ```bash
   git remote
   ```
5. If upstream is not found, add upstream with this command:

   ```bash
   git remote add upstream https://github.com/Varun-Kolanu/csoc_flutter.git
   ```

6. Fetch the code from remote:
   ```bash
   git fetch --all
   ```
7. Run the following command to install dependencies:

   ```bash
   flutter pub get
   ```

8. Run this to start running the app in Physical device or Android emulator:
   ```bash
   flutter run
   ```

## Contributing

Contributions to this app are welcome.
If you're looking to get into COPS, this is one of the projects we are considering. Irrespective of the result, you'll get a hands on experience in flutter and a wonderful experience contributing to an open source project.

### Picking an issue to work on

- To find possible issues to work on, see the [issues tab](https://github.com/Varun-Kolanu/csoc_flutter/issues). If it was not opened by a maintainer, choose those which has label 'approved' (Maintainers for this repo are [Varun Kolanu](https://github.com/Varun-Kolanu/), [Shashank Kumar](https://github.com/shashankiitbhu), [Prithvi Dutta](https://github.com/prithvihehe) )
- Choose according to your interests, complexity of the issue. Judgement depends on the complexity of issue, code cleanliness, commit discipline, solution developed and guidelines followed.
- After choosing an issue, ask in the comments to assign you that issue. Only after getting an issue assigned, start working on it.
- The first contributor who asked will get the assignment of issue in general.
- One contributor can only work on one issue at a time. If you have done most of the work, raised a PR and waiting for a maintainer review, you can reach out a maintainer to assign a new issue.

### Opening an issue

If you see any bug or want to suggest a new feature, open an issue by filling the issue template in issue tab.

### Making a Pull request

After completing an issue, commit them and make a pull request. The commit messages should follow commit guidelines.

- Before making a commit or before making a PR, always fetch the current remote repo from github into local machine so that any code changes by other contributors are reflected:
  ```bash
  git fetch --all
  ```
- Before making a PR rebase your repo with upstream with the following command and solve any merge conflicts if exist: (To know more about rebase refer to this [video](https://youtu.be/4aIazhclURE?feature=shared) ).

  ```bash
  git rebase upstream/main
  ```

- The PR message should contain any of the following keywords and should contain the issue number it is solving so that it gets linked in that issue:

  ```bash
  close, closes, closed, fix, fixes, fixed, resolve, resolves, resolved
  ```

  Example PR message:

  ```bash
  This PR does this...
  fixes #1
  ```

- Then make a PR to the upstream/main branch and check whether all tests from GitHub actions got passed.
- If you don't make any contributions in 3 days after getting issue assigned, your assignment will be removed.

### Commiting Guidelines

1. Each commit message should convey a single change.
2. If a change is suggested in a commit, don't do a new commit, rather undo the last commit and edit it. Use this command for this:

   ```bash
   git commit --amend -m "<your_commit_message>"
   ```

   This will replace the last commit fully with the new changes (including commit message and code changes)

3. _Important_: When you have edited the last commit, don't push it to the remote repo directly. Rather, use the following command:

   ```bash
   git push -f

   ```

4. Every commit message should follow a fixed format:

```bash
type(scope?): subject   #scope is optional
```

Example commit messages:

```bash
feat(blog): add comment section

fix: some message
```

Valid types:

![image](https://github.com/Varun-Kolanu/csoc_flutter/assets/112728411/98bd81a3-9f21-49c0-adac-2ea850ccf952)

Examples of scopes: server, ui, services etc

4. Before making a commit, always fetch using the command:

```bash
git fetch --all
```

### Important tools for making your life easier

1. Getting the commit hashes of all the previous commits:

   ```bash
   git log
   ```

2. Check a previous commit without resetting:

   ```bash
   git checkout <commit-hash>
   ```

3. Go to a commit by undoing all the next commits (For eg., go to commit 2 while undoing 3rd, 4th commits):

   ```bash
   git reset --hard <commit-hash>
   ```

4. Undo the last commit and keep the changes in local repo so that you can change them and recommit later:

   ```
   git reset --soft HEAD~1
   ```

5. For `git commit --amend` and `git rebase`, always use `git push -f` instead of simple `git push`
