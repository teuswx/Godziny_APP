package com.cefet.godziny.domain.casouso.atividade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import com.cefet.godziny.api.atividade.AtividadeRecuperarDto;
import com.cefet.godziny.constantes.atividade.EnumStatus;
import com.cefet.godziny.infraestrutura.persistencia.atividade.AtividadeRepositorioJpa;
import com.cefet.godziny.infraestrutura.persistencia.atividade.AtividadeEntidade;
import com.cefet.godziny.infraestrutura.rest.atividade.AtividadeRestConverter;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@AllArgsConstructor
public class PesquisarAtividadeCasoUso {
    @Autowired
    private final AtividadeRepositorioJpa atividadeRepositorioJpa;

    @NotNull(message = "O nome do usuario é obrigatório")
    private String usuarioNome;

    @NotNull(message = "O titulo da atividade é obrigatória")
    private String titulo;

    @NotNull(message = "O status da atividade é obrigatório")
    private EnumStatus status;

    @NotNull(message = "O nome da categoria é obrigatória")
    private String categoria;
    
    public void validarPesquisa() throws Exception {}

    public Page<AtividadeRecuperarDto> pesquisarAtividade(Pageable pageable) {
        Specification<AtividadeEntidade> specification = Specification.where(null);
    
        if (usuarioNome != null) {
            specification = specification.and((root, query, criteriaBuilder) ->
                criteriaBuilder.like(criteriaBuilder.lower(root.get("usuario").get("nome")), "%" + usuarioNome.toLowerCase() + "%"));
        }
        if (categoria != null) {
            specification = specification.and((root, query, criteriaBuilder) ->
                criteriaBuilder.like(criteriaBuilder.lower(root.get("categoria").get("nome")), "%" + categoria.toLowerCase() + "%"));
        }
        if (titulo != null) {
            specification = specification.and((root, query, criteriaBuilder) -> 
                criteriaBuilder.like(root.get("titulo"), "%" + titulo + "%"));
        }
        if (status != null) {
            specification = specification.and((root, query, criteriaBuilder) -> 
                criteriaBuilder.equal(root.get("status"), status));
        }

        Page<AtividadeRecuperarDto> pageAtividadeRecuperarDto = atividadeRepositorioJpa.listAtividades(specification, pageable)
            .map(AtividadeRestConverter::EntidadeToAtividadeRecuperarDto);
        
        return pageAtividadeRecuperarDto;
    }
    
}