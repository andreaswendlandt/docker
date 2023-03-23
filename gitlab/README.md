# Gitlab
when you create a gitlab container via docker-compose or docker the username to login to the webgui is root, the password you can find after running the following command:
```
docker exec -it gitlab_web_1 cat /etc/gitlab/initial_root_password
# WARNING: This value is valid only in the following conditions
#          1. If provided manually (either via `GITLAB_ROOT_PASSWORD` environment variable or via `gitlab_rails['initial_root_password']` setting in `gitlab.rb`, it was provided before database was seeded for the first time (usually, the first reconfigure run).
#          2. Password hasn't been changed manually, either via UI or via command line.
#
#          If the password shown here doesn't work, you must reset the admin password following https://docs.gitlab.com/ee/security/reset_user_password.html#reset-your-root-password.

Password: lOaxASh7X0yvRgOcFmwGyjnJQ5tSftn8hQUN7rk2mOY=

# NOTE: This file will be automatically deleted in the first reconfigure run after 24 hours.
```
