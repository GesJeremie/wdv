(function() {
    'use strict';

    function isBatman() {
        return window.app.config.isBatman;
    }

    _.mixin({'isBatman': isBatman});

}());
