## Introduction
 Hi, welcome to Escuela Dominical. Escuela Dominical means "Sunday School". Sunday School studies typically consist of an outline of three subtitles, each subtitle containing two points, and each point containing the information for the development of the given study. The most common way of delivering a study to a relatively large audience is through slides presentations, using a horizontal flow. Preparing such a presentation usually involves moving from slide to slide to add and/or edit information, and making a copy of a previous presentation to create a new one would require to delete the old info to repalce it with new info. Escuela Dominical is a Ruby on Rails applcation that allows users to create a full study in a single page through a smooth study creation process and a compact view design. The created study can then be presented through the application's focus views feature and vertical flow design. Editing, adding or deleting subtitles, points, notes or images is as simple as clicking on a study, make your desired changes, and click on save. No need to move through slides to locate your desired information. 

## Functionality
 Escuela Dominical lends itself as a powerful tool to create any type of study, and as a database for studies. The expected user stories for Escuela Dominical can be listed as:
 * A user can create a study, edit a study, and delete a study.
 * A user can view his/her created studies.
 * A user can view a list of all created studies by all users.
 * A user can view(only) a study of any other user.
 * While creating a study, a user can dynamically add or delete points fields and notes fields for a given subtitle field by clicking on a add point button or delete point button, respectively.
 * While editing a study, a user can dynamically add or delete points fields and notes fields for a given subtitle field by clicking on a add point button or delete point button, respectively.
 * While creating a study, a user can dynamically add or delete a subtitle field by clicking on a add subtitle button or delete subttile button, respectively.
 * While editing a study, a user can dynamically add or delete a subtitle field by clicking on a add subtitle button or delete subttile button, respectively.
 * While creating a study, a user can attach an image to a given note field.
 * While editing a study, a user can attach an image to a given note field or delete an existing image in a given note field. 
 * A user can select to see a list of all existing studies ordered by creation date (ascending or descending), or by title (alphabetically), or by user, or by year, or by semester and year.
 * A user can select to see a list of all his/her existing studies ordered by creation date (ascending or descending), or by title (alphabetically), or by year, or by semester and year.
 * In the show page of any given study, a usser can select to see the study in compact form, expanded form, or hash form.
 * In the show page of any given study, a user can click on a given point to expand the point and activate the focus view feature for that point.
 * In the show page of any given study, a user can click on a expanded point to compact the point and deactivate the focus view feature for that point.
 
 Esculea Dominical is currently under development, and it supports the below functionalities:
 * A user can create a study.
 * A user can view a list of his/her created studies.

## Getting Started
 To get started with the app, clone the repo to your local machine:
 ``` javascript
 $ git clone https://github.com/mmartinezluis/escuela-dominical.git
 ```
 
 Then, in the rroot directory install the needed gems:
 ``` javascript
 $ bundle install
 ```

 Run the application's migrations:
  ``` javascript
 $ rails db:migrate
 ```

 Add some data before starting the application using:
 ``` javascript
 $ rails db:seed
 ```

Finally, start the application:
 ``` javascript
 $ rails server
 ```

 Open a new tap in your browser and copy and paste the below code:
 ```javascript
 localhost:3000
 ```

## Special Feature
 Escuela Dominical counts with a powerful #build_outline Ruby method that allows to show all of the parts of a study in the most compacted way through a hash. 
