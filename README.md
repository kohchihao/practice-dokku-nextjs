# Practice Dokku NextJS

## Setup 

### Install Dokku on Digital Ocean 
1. Create Digital Ocean droplet with Dokku pre-installed 
2. Follow this [guide](http://dokku.viewdocs.io/dokku/getting-started/install/digitalocean/)

### Create app in Dokku 
1. `dokku apps:create practice-dokku`

### Prepare local app to push to Dokku 
1. Create your app with git locally 
2. Add remote `dokku` url
    ```
    git remote add dokku dokku@123.456.789.012:practice-dokku
    ```
3. Push to `dokku` remote
    ```
    git push dokku master
    ```
4. Your application will be launched on a particular port number Eg: `23149`. Thus your application URL will be like `http://68.101.221.21:23149` [Provided you use the `buildpack`. If you use `Dockerfile`, then the port number will be your docker file configuration]
   - Remember to open up the port number on your DO if not you will not be able to access the website. Follow this [guide](https://www.digitalocean.com/community/questions/security-tips-and-suggestion-dokku-node-js-app)
5. To change your application port number to port 80. Follow this [guide](https://github.com/dokku/dokku/blob/master/docs/networking/port-management.md)

### Adding a domain 
1. `dokku domains:add practice-dokku www.domain.tld`
2. Remember to configure your DigitalOcean records

### SSL Certificates 
1. Make sure the app has a domain.
2. Install [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt).
3. `dokku letsencrypt node-app`
4. `dokku letsencrypt:cron-job --add` so the certificate is renewed automatically every 3 months.


## Resources referred 
- https://pawelurbanek.com/optimize-dokku-deployment-speed
- https://itnext.io/frontend-dockerized-build-artifacts-with-nextjs-9463f3da3362
- https://www.albertgao.xyz/2019/01/28/how-to-create-your-own-dockerfile-for-a-rapid-dokku-deployment/
- https://medium.com/@pimterry/effortlessly-add-https-to-dokku-with-lets-encrypt-900696366890
- https://auth0.com/blog/hosting-applications-using-digitalocean-and-dokku/
- https://www.digitalocean.com/community/questions/security-tips-and-suggestion-dokku-node-js-app

