module.exports.mapUsers =(users) => {
    return users
      .map(u => {
        const {
          name: { first, last },
          gender,
          email,
          dob: { date }
        } = u
        return `(
             '${first}', '${last}', '${email}','${gender}','${date}','${(
          Math.random() + 1
        ).toFixed(2)}',false
          )`
      })
      .join(',')
  }