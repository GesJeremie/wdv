(function() {
    'use strict';

    /**
     * This controller is in charge to open the modal with the details
     * of a product.
     */
    var Controller = new Class({

        extends: Stimulus.Controller,

        cache: null,

        static: {
            targets: []
        },

        requestInProgress: false,

        /**
         * Boot
         */

        initialize: function () {
            this.setupModal();
        },

        setupModal: function () {
            this.modal = new tingle.modal();
        },

        /**
         * Events
         */

        onClickProduct: function () {
            this.hasCache() ? this.showContentFromCache() : this.showContentFromRequest();
        },

        /**
         * Methods
         */

        getProductContent: function () {
            return $.get('/products/' + this.data.get('productId') + '.json');
        },

        hasCache: function () {
            return !_.isNull(this.cache);
        },

        showContentFromCache: function () {
            this.modal.setContent(this.cache);
            this.modal.open();
        },

        showContentFromRequest: function () {
            if (this.requestInProgress) { return }

            this.requestInProgress = true;

            this.getProductContent().done(function (response) {
                this.requestInProgress = false;
                this.cache = response.content;
                this.modal.setContent(response.content);
                this.modal.open();
            }.bind(this));
        }
    });

    window.app.stimulus.register('productItem', Controller);
}());
