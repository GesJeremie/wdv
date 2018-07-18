(function() {
    'use strict';

    var Controller = new Class({

        extends: Stimulus.Controller,

        static: {
            targets: ['count']
        },

        /**
         * Ajax Requests
         */

        requests: {
            cart: function () {
                return $.get('/cart.json');
            }
        },

        /**
         * Boot
         */

        initialize: function () {
            this.setupEvents();
        },

        setupEvents: function () {
            $(document).on('headerCart:refresh', this.onCartRefresh.bind(this));
        },

        /**
         * Events
         */

        onCartRefresh: function () {
            this.requests.cart().done(function (response) {
                this.updateCount(response.count_quantities);
            }.bind(this));
        },

        /**
         * Methods
         */

        updateCount: function (count) {
            this.countTarget.innerHTML = count;
        }
    });

    window.app.stimulus.register('headerCart', Controller);
}());
