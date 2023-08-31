### This directory contains executable scripts, see below for actions of each script.

1. `0-iam_betty` :
	Switches the current user to `betty`. Assumes that the `user` betty will exist when it is run.
2. `1-who_am_i` :
	Prints the effective username of the current user.
3. `2-groups` : 
	Prints all the groups the current user is part of.
4. `3-new_owner` :
	changes the owner of the file `hello` to the user `betty`.
5. `4-empty` :
	creates an empty file called `hello`.
6. `5-execute` :
	adds execute permission to the owner of the file `hello`.
7. `6-multiple_permissions` :
	adds execute permission to the owner and the group owner, and read permission to other users, to the file `hello`. The file `hello` will be in the working directory.
8. `7-everybody` :
	adds execution permission to the owner, the group owner and the other users, to the file `hello`.
9. `8-James_Bond` :
	sets the permission to the file `hello` as follows:
	- Owner: no permission at all
	- Group: no permission at all
	- Other users: all the permissions
10. `9-John_Doe` :
	sets the mode of the file `hello` to this:
	```-rwxr-x-wx 1 julien julien 23 Sep 20 14:25 hello```.
11. `10-mirror_permissions` :
	sets the mode of the file `hello` the same as `olleh`’s mode.
12. `11-directories_permissions` :
	 adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users.
13. `12-directory_permissions` : 
	 creates a directory called `my_dir` with permissions 751 in the working directory.
14. `13-change_group` :
	changes the group owner to `school` for the file `hello`.
15. `100-change_owner_and_group` : 
	changes the owner to `vincent` and the group owner to `staff` for all the files and directories in the working directory.
16. `101-symbolic_link_permissions` :
	changes the owner and the group owner of `_hello` to `vincent` and `staff` respectively.
17. `102-if_only` : 
	 changes the owner of the file `hello` to `betty` only if it is owned by the user `guillaume`.
18. `103-Star_Wars` :
	plays the StarWars IV episode in the terminal.
