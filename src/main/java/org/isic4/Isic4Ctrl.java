package org.isic4;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/isic4")
@Tag(name = "ISIC4 Controller", description = "API for managing ISIC4 classifications")
public class Isic4Ctrl {

    @Autowired
    private Isic4Service isic4Service;

    /**
     * Retrieves all active ISIC4 sections with pagination.
     * Sections are the top-level classifications (A-U) like Agriculture, Manufacturing, etc.
     */
    @GetMapping("/sections")
    @Operation(
        summary = "Get all ISIC4 sections",
        description = "Retrieves a paginated list of all active ISIC4 sections. " +
                     "Sections are the highest level of classification (A-U) representing broad economic activities."
    )
    public Page<Isic4SectionDto> getAllSections(
        @Parameter(name = "length", description = "Number of records to return", example = "10") 
        @RequestParam(name = "length", defaultValue = "10") Integer length,
        @Parameter(name = "offset", description = "Number of records to skip", example = "0") 
        @RequestParam(name = "offset", defaultValue = "0") Integer offset
    ) {
        Pageable pageable = PageRequest.of(offset / length, length);
        return isic4Service.getAllSections(pageable);
    }

    /**
     * Retrieves all active divisions under a specific section with pagination.
     * Divisions are 2-digit codes under each section (e.g., 01-99).
     */
    @GetMapping("/sections/{sectionCode}/divisions")
    @Operation(
        summary = "Get divisions by section",
        description = "Retrieves a paginated list of all active divisions under a specific section. " +
                     "Divisions are 2-digit codes (01-99) representing broad industry categories within a section."
    )
    public Page<Isic4DivisionDto> getDivisionsBySection(
        @Parameter(name = "sectionCode", description = "Section code (A-U)", example = "A") 
        @PathVariable(value = "sectionCode") String sectionCode,
        @Parameter(name = "length", description = "Number of records to return", example = "10") 
        @RequestParam(name = "length", defaultValue = "10") Integer length,
        @Parameter(name = "offset", description = "Number of records to skip", example = "0") 
        @RequestParam(name = "offset", defaultValue = "0") Integer offset
    ) {
        Pageable pageable = PageRequest.of(offset / length, length);
        return isic4Service.getDivisionsBySection(sectionCode, pageable);
    }

    /**
     * Retrieves all active groups under a specific division with pagination.
     * Groups are 3-digit codes under each division (e.g., 011-999).
     */
    @GetMapping("/sections/{sectionCode}/divisions/{divisionCode}/groups")
    @Operation(
        summary = "Get groups by division",
        description = "Retrieves a paginated list of all active groups under a specific division. " +
                     "Groups are 3-digit codes (011-999) representing more specific industry subcategories."
    )
    public Page<Isic4GroupDto> getGroupsByDivision(
        @Parameter(name = "sectionCode", description = "Section code (A-U)", example = "A") 
        @PathVariable(value = "sectionCode") String sectionCode,
        @Parameter(name = "divisionCode", description = "Division code (01-99)", example = "01") 
        @PathVariable(value = "divisionCode") String divisionCode,
        @Parameter(name = "length", description = "Number of records to return", example = "10") 
        @RequestParam(name = "length", defaultValue = "10") Integer length,
        @Parameter(name = "offset", description = "Number of records to skip", example = "0") 
        @RequestParam(name = "offset", defaultValue = "0") Integer offset
    ) {
        Pageable pageable = PageRequest.of(offset / length, length);
        return isic4Service.getGroupsByDivision(sectionCode, divisionCode, pageable);
    }

    /**
     * Retrieves all active classes under a specific group with pagination.
     * Classes are 4-digit codes under each group (e.g., 0111-9999).
     */
    @GetMapping("/sections/{sectionCode}/divisions/{divisionCode}/groups/{groupCode}/classes")
    @Operation(
        summary = "Get classes by group",
        description = "Retrieves a paginated list of all active classes under a specific group. " +
                     "Classes are 4-digit codes (0111-9999) representing the most detailed level of industry classification."
    )
    public Page<Isic4ClassDto> getClassesByGroup(
        @Parameter(name = "sectionCode", description = "Section code (A-U)", example = "A") 
        @PathVariable(value = "sectionCode") String sectionCode,
        @Parameter(name = "divisionCode", description = "Division code (01-99)", example = "01") 
        @PathVariable(value = "divisionCode") String divisionCode,
        @Parameter(name = "groupCode", description = "Group code (011-999)", example = "011") 
        @PathVariable(value = "groupCode") String groupCode,
        @Parameter(name = "length", description = "Number of records to return", example = "10") 
        @RequestParam(name = "length", defaultValue = "10") Integer length,
        @Parameter(name = "offset", description = "Number of records to skip", example = "0") 
        @RequestParam(name = "offset", defaultValue = "0") Integer offset
    ) {
        Pageable pageable = PageRequest.of(offset / length, length);
        return isic4Service.getClassesByGroup(sectionCode, divisionCode, groupCode, pageable);
    }
}
