set -e

INITIALIZED=false

if [ ! -z "${GIT_REPOSITORY}" ]; then
	echo "Git is enabled"
	echo "Configuring git"
	git config --global user.name "${GIT_NAME}"
	git config --global user.email "${GIT_EMAIL}"
	git config --global init.defaultBranch main
	echo

	echo "Checking ${GIT_REPOSITORY}"
	GIT_REPO_EXISTS=`git ls-remote ${GIT_REPOSITORY} 2>1 /dev/null; echo $?`
	echo

	if [ "${GIT_REPO_EXISTS}" = 0 ]; then
		echo "Repository exists"
		echo "Cloning ${GIT_REPOSITORY} into /space/"

		git clone --single-branch ${GIT_REPOSITORY} /space/

		INITIALIZED=true
		echo
	else
		echo "${GIT_REPOSITORY} does not exist"
		echo
	fi
else
	echo "No repository given"
fi

if [ "${INITIALIZED}" = false ]; then
	if [ ! -z "${INIT_REPOSITORY}" ]; then
		echo "Cloning ${INIT_REPOSITORY} into /space/"
		git clone --verbose ${INIT_REPOSITORY} /space/
		echo

		if [ ! -z "${GIT_REPOSITORY}" ]; then
			echo "Configuring repository"
			cd /space
			rm -rf .git
			git init .
			git remote add origin ${GIT_REPOSITORY}
			git add .
			git commit -m 'Initial commit'
			echo git push --set-upstream origin main
			echo
		fi
	else
		echo "No initialization repository given"
		exit 1
	fi
fi

echo "Initialization complete"
