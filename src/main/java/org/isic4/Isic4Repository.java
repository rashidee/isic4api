package org.isic4;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Isic4Repository extends JpaRepository<Isic4, Integer> {

    /**
     * Retrieves all active ISIC4 sections with pagination.
     * Sections are the top-level classifications (A-U).
     * 
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 section entities
     */
    @Query("SELECT i FROM Isic4 i " +
           "WHERE i.levelType = :levelType " +
           "AND i.isActive = true " +
           "ORDER BY i.sectionCode")
    Page<Isic4> findAllSections(@Param("levelType") Isic4.LevelType levelType, Pageable pageable);

    /**
     * Retrieves all active divisions under a specific section with pagination.
     * Divisions are 2-digit codes under each section (e.g., 01-99).
     * 
     * @param sectionCode the section code (A-U) to filter divisions
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 division entities for the specified section
     */
    @Query("SELECT i FROM Isic4 i " +
           "WHERE i.levelType = :levelType " +
           "AND i.sectionCode = :sectionCode " +
           "AND i.isActive = true " +
           "ORDER BY i.divisionCode")
    Page<Isic4> findDivisionsBySection(@Param("levelType") Isic4.LevelType levelType, 
                                       @Param("sectionCode") String sectionCode, 
                                       Pageable pageable);

    /**
     * Retrieves all active groups under a specific division with pagination.
     * Groups are 3-digit codes under each division (e.g., 011-999).
     * 
     * @param sectionCode the section code (A-U)
     * @param divisionCode the division code (01-99) to filter groups
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 group entities for the specified division
     */
    @Query("SELECT i FROM Isic4 i " +
           "WHERE i.levelType = :levelType " +
           "AND i.sectionCode = :sectionCode " +
           "AND i.divisionCode = :divisionCode " +
           "AND i.isActive = true " +
           "ORDER BY i.groupCode")
    Page<Isic4> findGroupsByDivision(@Param("levelType") Isic4.LevelType levelType,
                                     @Param("sectionCode") String sectionCode, 
                                     @Param("divisionCode") String divisionCode, 
                                     Pageable pageable);

    /**
     * Retrieves all active classes under a specific group with pagination.
     * Classes are 4-digit codes under each group (e.g., 0111-9999).
     * 
     * @param sectionCode the section code (A-U)
     * @param divisionCode the division code (01-99)
     * @param groupCode the group code (011-999) to filter classes
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 class entities for the specified group
     */
    @Query("SELECT i FROM Isic4 i " +
           "WHERE i.levelType = :levelType " +
           "AND i.sectionCode = :sectionCode " +
           "AND i.divisionCode = :divisionCode " +
           "AND i.groupCode = :groupCode " +
           "AND i.isActive = true " +
           "ORDER BY i.classCode")
    Page<Isic4> findClassesByGroup(@Param("levelType") Isic4.LevelType levelType,
                                   @Param("sectionCode") String sectionCode,
                                   @Param("divisionCode") String divisionCode,
                                   @Param("groupCode") String groupCode,
                                   Pageable pageable);
}
