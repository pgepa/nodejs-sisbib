'use strict';

module.exports = (sequelize, DataTypes) => {
    const User_Roles = sequelize.define('user_roles', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        userId: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        roleId: {
          type: DataTypes.INTEGER,
          allowNull: false
      },
    });
    return User_Roles;
};
