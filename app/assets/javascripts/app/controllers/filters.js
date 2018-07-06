(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        slideout: null,

        static: {
            targets: ['content']
        },

        onClickButton: function() {
            $(this.contentTarget).toggle();
        }
    });

    window.app.stimulus.register('filters', Controller);
}());
