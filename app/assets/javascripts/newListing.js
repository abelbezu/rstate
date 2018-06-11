$(function () {
  $(document).on('cocoon:after-insert', function(e, insertedItem) {
    insertImage(insertedItem)

  });

  $(document).on('cocoon:before-remove', function(e, removedItem) {
    removeImage(removedItem);
  });
});