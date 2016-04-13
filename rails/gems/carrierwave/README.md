# Carrierwave with Multi-Upload
This guide is about setting up carrierwave with multi-upload without any
image manipulation.

<br>
An example demo code is available in this link:
https://github.com/hollowaykeanho/rails-carrierwave-demo

<br><hr><br><br>

## Assumptions
This guide assumes you:

1. know your Rails well.
2. know your git well.


<br><hr><br><br>
## Steps
### 1) Add the multi-upload Carrierwave Gem into Gemfile
```
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
```

<br><hr><br><br>

### 2) Create the multi-upload column to the table
You can now go ahead and create a column that stores the photo details.

```
$ rails generate migration add_photos_to_locations photos:json
```

> NOTE:
>
> Not all database supports json, such as sqlite3. In these senarios, you can
> set set the column type as text.
>
> ```
> $ rails generate migration add_photos_to_locations photos:text
> ```

<br><hr><br><br>

### 3) Generate an uploader
You can generate the uploader.

```
$ rails generate uploader PhotoUploader
```

<br><hr><br><br>

### 4) Mount the uploader to the model
You can mount the uploader by attaching it to the model. The code looks
something like this:

<br>
```
class Location < ActiveRecord::Base
  mount_uploaders :photos, PhotoUploader
end
```

<br>
> NOTE:
>
> For database that doesn't support json, you'll need to add serialize to that
> column as Array. The example code looks something like the following:
>
> ```
> class Location < ActiveRecord::Base
>  mount_uploaders :photos, PhotoUploader
>  serialize :photos, Array # Sqlite3 can't handle json.
> end
> ```

<br><hr><br><br>

### 5) Add the file uploader into your view file
Now you can append your file_field into your form. Please ensures you 

```
<%= f.file_field :photos, multiple: true %>
```

<br><hr><br><br>

### 6) Append the columns into your strong params
Now, you can append the array set for the file field. In the following example,
it is ```{photos: []}```.

```
params.require(:location).permit(:name, :address, {photos: []})
```

<br><hr><br><br>

### 7) Test it.
Run your app. While the file upload is selected, select multiple files using
SHIFT or CTRL clicking.

It should be working now.

<br><hr><br><br>

### 8) Present the images
In case you need to present the images, you can append the image url to the
image source tag. An example looks something like this:

On controller file:
```
@location = Location.find(params[:id])
```

<br>
On view file:
```
<div>
  <ul>
    <% @location.photos.each do |photo| %>
      <li><img src="<%= photo.url %>"></img></li>
    <% end %>
  </ul>
</div>
```


<br><hr><br><br>

## References
1. https://github.com/carrierwaveuploader/carrierwave
2. http://stackoverflow.com/questions/28064441/rails-4-carrierwave-gem-typeerror-on-assign-to-uploader
