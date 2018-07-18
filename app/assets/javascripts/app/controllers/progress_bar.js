(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        static: {
            targets: ['content']
        },

        /**
         * Boot
         */

        initialize: function () {
            this.setupProgressBar();
        },

        setupProgressBar: function () {
            $(this.contentTarget).css('width', this.getWidth());
        },

        /**
         * Methods
         */

        getWidth: function () {
            return this.data.get('width');
        }
    });

    window.app.stimulus.register('progressBar', Controller);
}());
