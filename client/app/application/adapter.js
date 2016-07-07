import JSONAPIAdapter from 'ember-data/adapters/json-api';

export default JSONAPIAdapter.extend({
  host: 'https://habitus-crodeheaver.c9users.io',
  namespace: 'api/v1'
});
