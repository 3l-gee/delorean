package com.aixm.delorean.core.configuration;

public class Configuration {

    // Singleton instance (optional)
    private static Configuration instance;

    // Configuration fields for database naming conventions
    private String databaseTableNamePrefix;
    private String databaseTableNameSuffix;
    private String columnNamePrefix;
    private String columnNameSuffix;
    private String foreignKeyNamePrefix;
    private String indexNamePrefix;
    private String primaryKeyNamePrefix;

    // Private constructor to prevent instantiation
    private Configuration() {
        // Set default values or load from properties/environment
        this.databaseTableNamePrefix = "tbl_";
        this.databaseTableNameSuffix = "";
        this.columnNamePrefix = "col_";
        this.columnNameSuffix = "";
        this.foreignKeyNamePrefix = "fk_";
        this.indexNamePrefix = "idx_";
        this.primaryKeyNamePrefix = "pk_";
    }

    // Static method to get the singleton instance (optional)
    public static Configuration getInstance() {
        if (instance == null) {
            instance = new Configuration();
        }
        return instance;
    }

    // Getters and Setters for configuration fields
    public String getDatabaseTableNamePrefix() {
        return databaseTableNamePrefix;
    }

    public void setDatabaseTableNamePrefix(String databaseTableNamePrefix) {
        this.databaseTableNamePrefix = databaseTableNamePrefix;
    }

    public String getDatabaseTableNameSuffix() {
        return databaseTableNameSuffix;
    }

    public void setDatabaseTableNameSuffix(String databaseTableNameSuffix) {
        this.databaseTableNameSuffix = databaseTableNameSuffix;
    }

    public String getColumnNamePrefix() {
        return columnNamePrefix;
    }

    public void setColumnNamePrefix(String columnNamePrefix) {
        this.columnNamePrefix = columnNamePrefix;
    }

    public String getColumnNameSuffix() {
        return columnNameSuffix;
    }

    public void setColumnNameSuffix(String columnNameSuffix) {
        this.columnNameSuffix = columnNameSuffix;
    }

    public String getForeignKeyNamePrefix() {
        return foreignKeyNamePrefix;
    }

    public void setForeignKeyNamePrefix(String foreignKeyNamePrefix) {
        this.foreignKeyNamePrefix = foreignKeyNamePrefix;
    }

    public String getIndexNamePrefix() {
        return indexNamePrefix;
    }

    public void setIndexNamePrefix(String indexNamePrefix) {
        this.indexNamePrefix = indexNamePrefix;
    }

    public String getPrimaryKeyNamePrefix() {
        return primaryKeyNamePrefix;
    }

    public void setPrimaryKeyNamePrefix(String primaryKeyNamePrefix) {
        this.primaryKeyNamePrefix = primaryKeyNamePrefix;
    }

    // Utility methods to generate standardized names
    public String generateTableName(String baseName) {
        return databaseTableNamePrefix + baseName + databaseTableNameSuffix;
    }

    public String generateColumnName(String baseName) {
        return columnNamePrefix + baseName + columnNameSuffix;
    }

    public String generateForeignKeyName(String baseName) {
        return foreignKeyNamePrefix + baseName;
    }

    public String generateIndexName(String baseName) {
        return indexNamePrefix + baseName;
    }

    public String generatePrimaryKeyName(String baseName) {
        return primaryKeyNamePrefix + baseName;
    }

    public void loadFromPropertiesFile(String filePath) {
        // TODO Implement logic to load properties from a file
    }

    public void loadFromEnvironmentVariables() {
        // TODO Implement logic to load environment variables
    }
}
