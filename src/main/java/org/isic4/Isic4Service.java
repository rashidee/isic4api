package org.isic4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class Isic4Service {

    @Autowired
    private Isic4Repository isic4Repository;

    /**
     * Retrieves all active ISIC4 sections with pagination.
     * Sections are the top-level classifications (A-U) like Agriculture, Manufacturing, etc.
     * 
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 section DTOs containing section code and title
     */
    public Page<Isic4SectionDto> getAllSections(Pageable pageable) {
        Page<Isic4> sections = isic4Repository.findAllSections(Isic4.LevelType.Section, pageable);
        return sections.map(isic4 -> Isic4SectionDto.builder()
                .code(isic4.getSectionCode())
                .title(isic4.getTitle())
                .build());
    }

    /**
     * Retrieves all active divisions under a specific section with pagination.
     * Divisions are 2-digit codes under each section (e.g., 01-99) representing 
     * broad industry categories within a section.
     * 
     * @param sectionCode the section code (A-U) to filter divisions
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 division DTOs for the specified section
     */
    public Page<Isic4DivisionDto> getDivisionsBySection(String sectionCode, Pageable pageable) {
        Page<Isic4> divisions = isic4Repository.findDivisionsBySection(Isic4.LevelType.Division, sectionCode, pageable);
        return divisions.map(isic4 -> Isic4DivisionDto.builder()
                .code(isic4.getDivisionCode())
                .title(isic4.getTitle())
                .build());
    }

    /**
     * Retrieves all active groups under a specific division with pagination.
     * Groups are 3-digit codes under each division (e.g., 011-999) representing
     * more specific industry subcategories within a division.
     * 
     * @param sectionCode the section code (A-U)
     * @param divisionCode the division code (01-99) to filter groups
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 group DTOs for the specified division
     */
    public Page<Isic4GroupDto> getGroupsByDivision(String sectionCode, String divisionCode, Pageable pageable) {
        Page<Isic4> groups = isic4Repository.findGroupsByDivision(Isic4.LevelType.Group, sectionCode, divisionCode, pageable);
        return groups.map(isic4 -> Isic4GroupDto.builder()
                .code(isic4.getGroupCode())
                .title(isic4.getTitle())
                .build());
    }

    /**
     * Retrieves all active classes under a specific group with pagination.
     * Classes are 4-digit codes under each group (e.g., 0111-9999) representing
     * the most detailed level of industry classification.
     * 
     * @param sectionCode the section code (A-U)
     * @param divisionCode the division code (01-99)
     * @param groupCode the group code (011-999) to filter classes
     * @param pageable pagination parameters (page number, size, sort)
     * @return paginated list of ISIC4 class DTOs for the specified group
     */
    public Page<Isic4ClassDto> getClassesByGroup(String sectionCode, String divisionCode, String groupCode, Pageable pageable) {
        Page<Isic4> classes = isic4Repository.findClassesByGroup(Isic4.LevelType.Class, sectionCode, divisionCode, groupCode, pageable);
        return classes.map(isic4 -> Isic4ClassDto.builder()
                .code(isic4.getClassCode())
                .title(isic4.getTitle())
                .build());
    }
}
