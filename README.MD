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
    
### What i need to do : 
- [ ] handle request,sql errors
- [ ] scale REST API with PUT,OPTION methods
- [ ] add custom fields to quick edit mode


### Install:
 - clone project to your server enviroment
 - import DB dump to wordpress DB
 - go to `{hostname}/wordpress/wp-admin`
                     
Login  | Password
------------- | -------------
admin | wordpress
