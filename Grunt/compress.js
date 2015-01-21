//Written by Stephen Fornal on 2015/01/14
'use strict';

//Compress the theme into a ZIP file for Deployment to Active Data
module.exports = {
    options: {
        mode: 'zip',
        pretty: true,
        output: 'dist/<%= package.name %>-v<%= package.version %>.zip'
    },

    default: {
        files: [{
            expand: true,
            cwd: 'dist/raw',
            src: '**/*',
            dest: '/'
        }]
    }
};
