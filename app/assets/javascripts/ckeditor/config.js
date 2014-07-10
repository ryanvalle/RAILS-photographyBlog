var instance = CKEDITOR.instances['content_body'];

CKEDITOR.config.toolbar = [
    { name: 'styles', items : ['Format' ] },
    { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
    { name: 'insert', items : [ 'Image','Table','Smiley','SpecialChar' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
    { name: 'links', items : [ 'Link','Unlink' ] },
    { name: 'tools', items : [ 'Maximize' ] },
    { name: 'tools', items : [ 'Source' ] },
];

CKEDITOR.config.allowedContent = true; 

CKEDITOR.config.contentsCss = '/assets/fonts.css';