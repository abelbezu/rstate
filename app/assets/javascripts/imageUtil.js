function insertImage(insertedItem, authenticityToken) {
  var $insertedItem = $(insertedItem);
  var $imageContainer = $insertedItem.find(".image-preview-container");
  var $removeImageBtn = $insertedItem.find(".removeImageBtn");
  var $loadingImageOverlay = $insertedItem.find(".loading-image-overlay");
  var $currentImage = undefined;
  var $imageIdField = $insertedItem.find(".imageId");
  var $imageUrlField = $insertedItem.find(".imageUrl");
  $(insertedItem).fileupload({
    url: "/images/upload",

    headers : {
      'X-CSRF-Token' : authenticityToken
    },

    change: function (e, data) {
      loadImage(
        data.files[0],
        function (img) {
          if (img && img.src !== "") {
            $currentImage = img;
            $imageContainer.append(img);
            $(img).addClass("image-preview");
            $(img).addClass("image-opacity");
            $loadingImageOverlay.removeClass("hidden");
            }          
          },
          {
            maxWidth: 600,
            imageMaxHeight: 600
          } 
      );
    },

    done: function (e, data) {
      $removeImageBtn.removeClass("hidden");
      $loadingImageOverlay.addClass("hidden");
      if ($currentImage) {
        $($currentImage).removeClass("image-opacity");
      }
      // Handle errors correctly
      $imageIdField.val(data.result.id);
      $imageUrlField.val(data.result.url)
      
    }
  });
}

function removeImage(removedItem, authenticityToken) {
  var $removedItem = $(removedItem);
  var $imageIdField = $removedItem.find(".imageId");
  var $imageContainer = $removedItem.find(".image-preview-container");
  $.ajax({
    method: "POST",
    url: "/images/remove_image",
    data: { id: $imageIdField.val()},
    headers : {
      'X-CSRF-Token' : authenticityToken
    },
  })
}

function renderImages() {
    $(".nested-fields").each(function(index, nestedField) {
      var $nestedField = $(nestedField);
      var $imageUrl = $nestedField.find(".imageUrl");
      var $removeImageBtn = $nestedField.find(".removeImageBtn");
      var $imageContainer = $nestedField.find(".image-preview-container"); 
      var url = $imageUrl.val();
      var img = document.createElement("img");
      
      img.src = url;
      $(img).addClass("image-preview");    
      $removeImageBtn.removeClass("hidden");
      $imageContainer.append(img);
    });
  }