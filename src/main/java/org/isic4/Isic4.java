package org.isic4;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "isic4_classifications",
       uniqueConstraints = @UniqueConstraint(
           name = "unique_classification", 
           columnNames = {"section_code", "division_code", "group_code", "class_code"}
       ),
       indexes = {
           @Index(name = "idx_section", columnList = "section_code"),
           @Index(name = "idx_division", columnList = "division_code"),
           @Index(name = "idx_group", columnList = "group_code"),
           @Index(name = "idx_class", columnList = "class_code"),
           @Index(name = "idx_level_type", columnList = "level_type"),
           @Index(name = "idx_parent", columnList = "parent_code")
       })
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Isic4 {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "section_code", length = 1, nullable = false)
    private String sectionCode;
    
    @Column(name = "division_code", length = 2, nullable = false)
    private String divisionCode;
    
    @Column(name = "group_code", length = 3, nullable = true)
    private String groupCode;
    
    @Column(name = "class_code", length = 4, nullable = true)
    private String classCode;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "level_type", nullable = false)
    private LevelType levelType;
    
    @Column(name = "title", length = 500, nullable = false)
    private String title;
    
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
    
    @Column(name = "includes", columnDefinition = "TEXT")
    private String includes;
    
    @Column(name = "excludes", columnDefinition = "TEXT")
    private String excludes;
    
    @Column(name = "parent_code", length = 4, nullable = true)
    private String parentCode;
    
    @Builder.Default
    @Column(name = "is_active", nullable = false, columnDefinition = "BOOLEAN DEFAULT TRUE")
    private Boolean isActive = true;
    
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false, 
            columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime createdAt;
    
    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false, 
            columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP")
    private LocalDateTime updatedAt;
    
    public enum LevelType {
        Section, Division, Group, Class
    }
}
