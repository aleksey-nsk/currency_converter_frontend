# Info

Task **Currency converter**. Detailed task requirements see in files/**task.pdf**.  
Project consists of repositories:  
- [Backend](https://github.com/aleksey-nsk/currency_converter_backend)
- Frontend (current repository)
- [Deployment](https://github.com/aleksey-nsk/currency_converter_deployment)

# Frontend

1. The frontend is created as **SPA**: there is a single HTML-file with layout, and JS-script  
   for dynamic data loading from the backend. **AngularJS** is used. The file structure:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/01_1_structure.png)  
   
2. For local start we use container with **NGINX**. Container settings are specified  
   in the **docker-compose.yaml**:  
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/02_1_docker.png)  

   _We want to receive and view html-pages using **Web Server**. How can we transfer any
   html files into container? Volumes will help us with this. The **volumes directive** says, that  
   the local **./html** folder mount into container at **/usr/share/nginx/html**. When mounted, the folder
   at the specified address inside the container is replaced by a folder from the local machine_.

   _It is important to note, that the mounted folder is available for **real-time changes**. That is if we
   change text in the index.html file, or add a new file to the folder, then all these changes will be
   immediately available inside container. This important feature allows us to do development using docker.
   We are making changes to our mounted files and folders, and they are immediately displayed in the container_.
   
3. First, you nedd to run locally [backend project](https://github.com/aleksey-nsk/currency_converter_backend).
   Next, int the frontend project start the nginx-container and open in browser http://localhost:8099/    
   We get the lock associated with **CORS**:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/03_1_cors_error.png)    
   
   In order to solve this problem we need to **set up CORS** on backend
   (look to [backend repository, item 10](https://github.com/aleksey-nsk/currency_converter_backend)).
   
4. As a result, the running application looks like this:    
   ![](https://github.com/aleksey-nsk/currency_converter_frontend/blob/master/screenshots/04_1_app_run.png)  
   
# Create image

- We will write the commands for image creating in the file build/**Dockerfile**

- In order not to build every time in the console manually, we create the script **build_and_push.sh**

- Next, you need to log in to **Docker Hub** using console

- Finally run the **build_and_push.sh**. The frontend image will be created and uploaded to **Docker Hub**
