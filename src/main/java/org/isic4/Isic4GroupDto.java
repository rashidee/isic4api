package org.isic4;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Isic4GroupDto {

    private String code;
    private String title;
    private List<Isic4ClassDto> classes;
}
