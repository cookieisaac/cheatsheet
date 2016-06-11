#Initialize local directory as a Git repo
git init 

git config --global user.name "Ike Ma"
git config --global user.email myemail@gmail.com
git config --list

#Stage files for the commit
git add .

#Commit the staged file to local repository
git commit -m "Initial Commit"

#Add github repo as origin
git remote add origin https://github.com/cookieisaac/[ProjectName].git
git remote -v

#Push the change to github
git push origin master

#Pull the change from github
git pull origin master
