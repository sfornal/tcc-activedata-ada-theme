//Written by Stephen Fornal on 2015/01/21
'use strict';

//Delete everything in dist/ and tmp/
module.exports = {
   default: {
        files: [{
            dot: true,
            src: ['dist/**', 'tmp/**']
        }]
   }
};
