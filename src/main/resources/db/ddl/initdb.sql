-- ISIC Revision 4 Database Schema
-- Drop table if exists (for clean recreation)
DROP TABLE IF EXISTS isic4_classifications;

-- Create ISIC4 classifications table
CREATE TABLE isic4_classifications
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    section_code  CHAR(1)      NOT NULL COMMENT 'Section level (A-U)',
    division_code CHAR(2)      NOT NULL COMMENT 'Division level (01-99)',
    group_code    CHAR(3) NULL COMMENT 'Group level (011-999)',
    class_code    CHAR(4) NULL COMMENT 'Class level (0111-9999)',
    level_type    ENUM('Section', 'Division', 'Group', 'Class') NOT NULL,
    title         VARCHAR(500) NOT NULL COMMENT 'Official title/description',
    description   TEXT NULL COMMENT 'Detailed description',
    includes      TEXT NULL COMMENT 'What this classification includes',
    excludes      TEXT NULL COMMENT 'What this classification excludes',
    parent_code   VARCHAR(4) NULL COMMENT 'Parent classification code',
    is_active     BOOLEAN   DEFAULT TRUE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Indexes for better performance
    INDEX         idx_section (section_code),
    INDEX         idx_division (division_code),
    INDEX         idx_group (group_code),
    INDEX         idx_class (class_code),
    INDEX         idx_level_type (level_type),
    INDEX         idx_parent (parent_code),

    -- Unique constraint on the full code combination
    UNIQUE KEY unique_classification (section_code, division_code, group_code, class_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
COMMENT='ISIC Revision 4 Industrial Classifications';