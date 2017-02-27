$(".dropdown-menu li a").click(function(){
  $(this).parents(".dropdown").find('.btnLabel').html($(this).text() + ' <span class="caret"></span>');
  $(this).parents(".dropdown").find('.btnLabel').val($(this).data('value'));
});

+ function($) {
    'use strict';
    // UPLOAD CLASS DEFINITION
    // ======================
    var dropZone = document.getElementById('drop-zone');
    var uploadForm = document.getElementById('js-upload-form');
    var startUpload = function(files) {
        console.log(files)
    }
    uploadForm.addEventListener('submit', function(e) {
        var uploadFiles = document.getElementById('js-upload-files').files;
        e.preventDefault()
        startUpload(uploadFiles)
    })
    dropZone.ondrop = function(e) {
        e.preventDefault();
        this.className = 'upload-drop-zone';
        startUpload(e.dataTransfer.files)
    }
    dropZone.ondragover = function() {
        this.className = 'upload-drop-zone drop';
        return false;
    }
    dropZone.ondragleave = function() {
        this.className = 'upload-drop-zone';
        return false;
    }
}(jQuery);
