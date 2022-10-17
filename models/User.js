const { mapUsers } = require('../utils')

module.exports = class User {
  static _client
  static _tableName
  static async findAll () {
    const res = await this._client.query(`
 SELECT * FROM "${this._tableName}"`)
  }
  static async bulkCreate (users) {
    return await this._client.query(`
    INSERT INTO "${this._tableName}"(
        "first_name",
        "last_name",
        "email",
        "gender",
        "birthday",
        "height",
        "issubsribe"
    ) VALUES ${mapUsers(users)}`)
  }
}
