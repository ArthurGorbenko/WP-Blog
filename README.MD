## WP-Blog with twentysixteen child theme
### Tasks:
- [x] create custom form with all kind of input
- [x] save data to custom entity(CPT in WP)
- [x] make REST API for this entity
- [x] handle user account permissions

### What I did : 
- created `custom-form.php` template
- added `hooks` to handle form submit
- added `Custom Post Type news` in `functions.php`
- enabled user registration
- installed [JWT Authentication for WP REST API](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) to handle authenticated requests
- created `REST API Plugin for news` to  make custom routes and endpoints for CPT
  - `news/v1/published` 
    - GET : get all news
    - POST : suggest news
  - `news/v1/user`
    - POST:register new user
  - `jwt-auth/v1/news/v1/published/{ID}`
    - GET : get news with `{ID}`
    - POST : replace news with `{ID}`
    - DELETE : delete news with `{ID}`
  - created [React News app](https://github.com/ArthurGorbenko/NewsApp) based on this REST API
    
### What I need to do : 
- [ ] handle request,sql errors
- [ ] scale REST API with PUT,OPTION methods
- [ ] add custom fields to quick edit mode


### Installation:
 - clone project to your server enviroment
 - import `wp-db-dump.sql` to wordpress DB though mysql cli or phpmyadmin and make necessary changes in `wp-config.php`
 - browse to http://localhost/WP-Blog/
                     
Login  | Password
------------- | -------------
admin | admin

### Troubleshooting broken links
if you run into error 404 when browsing the site try:
1. switching from `post name` to `plain` and back to `post name` at http://localhost/WP-Blog/wp-admin/options-permalink.php to update permalink structure
2. make sure your `httpd.conf` has line `LoadModule rewrite_module modules/mod_rewrite.so` and `AllowOverride All` under your http root dir `(<Directory "/srv/http">)`
