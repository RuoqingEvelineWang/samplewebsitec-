# samplewebsitec#

step 1. make a new database named Project in SSMS and run the script in Database folder (recommend to run the with data version so the database is populated)
step 2. in Source/Proj/Web.config, line 45, fill in the User ID and Password for SSMS to connect
step 3. open Source/Proj.sln in Visual Studio, run Proj project with Google Chrome (other browsers might not display correctly for date picker)
step 4. if not able to load page, add '/homepage.aspx' after the localhost url in the browser
step 5. can add project, add task, edit task, view project summary and chart for a chosen week
