import JSONAPIAdapter from 'ember-data/adapters/json-api';
import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';

export default JSONAPIAdapter.extend(DataAdapterMixin, {
  host: 'https://habitus-crodeheaver.c9users.io',
  namespace: 'api/v1',
  authorizer: 'authorizer:application'
});
