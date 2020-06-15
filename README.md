# React Production deployment

## Steps to deploy reactjs application with subdirectory e.g /web
	
## 1. Specify a homepage on your package.json. Example: "homepage": "/web".
	
	`package.json
	  "homepage": "/web",`

## 2. Add below line in .env file
	PUBLIC_URL="/web"		
	
## 3. Update your BrowserRouter by adding a basename. 
 
  ### basepath setup:
	`function App() {
		return (
			<BrowserRouter basename={process.env.PUBLIC_URL}>
				<Routes />
			</BrowserRouter>
		);
	}`

## 4. If you are referencing a static file by it's relative path, you should add the subdirectory to that reference.

	`const mediaPaths = {
		  appLogo: {
			label: "appLogo",
			image: `${process.env.PUBLIC_URL}/images/appLogo.png`,
		  },
	}`
		
## 5. Nginx change. (copy all the build artifacts in C:\www\web(Windows) directory)

    `server {
        listen	8000;
	      server_name  localhost;

        location ^~ /web {
          alias C:\www\web;
          try_files $uri $uri/ /web/index.html;
        }
    }`
	  
    
    
# To use with serve

## In package.json
	`"build": "react-scripts build && .\\postBuid.sh web",
	"serve": "serve -s build -l 3000",`


### Sources: 
https://stackoverflow.com/questions/41495658/use-custom-build-output-folder-when-using-create-react-app https://stackoverflow.com/questions/53207059/react-nginx-routing-to-subdirectory
