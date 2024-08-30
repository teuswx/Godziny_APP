package com.cefet.godziny.domain.casouso.usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import com.cefet.godziny.api.usuario.UsuarioRecuperarDto;
import com.cefet.godziny.infraestrutura.persistencia.curso.CursoEntidade;
import com.cefet.godziny.infraestrutura.persistencia.curso.CursoRepositorioJpa;
import com.cefet.godziny.infraestrutura.persistencia.usuario.UsuarioEntidade;
import com.cefet.godziny.infraestrutura.persistencia.usuario.UsuarioRepositorioJpa;
import com.cefet.godziny.infraestrutura.rest.usuario.UsuarioRestConverter;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@AllArgsConstructor
public class PesquisarUsuarioCasoUso {
    @Autowired
    private final UsuarioRepositorioJpa usuarioRepositorioJpa;

    @Autowired
    private final CursoRepositorioJpa cursoRepositorioJpa;

    @NotNull(message = "A matricula do usuário é obrigatória")
    private Integer matricula;

    @NotNull(message = "A sigla do curso do usuário é obrigatória")
    private String cursoSigla;

    @NotNull(message = "O nome do usuário é obrigatório")
    private String nome;

    public CursoEntidade validarPesquisa() throws Exception {
        return cursoRepositorioJpa.findBySigla(cursoSigla);
    }
    
    public Page<UsuarioRecuperarDto> pesquisarUsuarios(Pageable pageable) {
        Specification<UsuarioEntidade> specification = Specification.where(null);
    
        if (nome != null) {
            specification = specification.and((root, query, criteriaBuilder) -> 
                criteriaBuilder.like(root.get("nome"), "%" + nome + "%"));
        }
        if (matricula != null) {
            specification = specification.and((root, query, criteriaBuilder) -> 
                criteriaBuilder.equal(root.get("matricula"), matricula));
        }
        if (cursoSigla != null) {
            specification = specification.and((root, query, criteriaBuilder) ->
                criteriaBuilder.like(criteriaBuilder.lower(root.get("curso").get("sigla")), "%" + cursoSigla.toLowerCase() + "%"));
        }
    
        Page<UsuarioRecuperarDto> pageUsuarioRecuperarDto = usuarioRepositorioJpa.listUsuarios(specification, pageable)
            .map(UsuarioRestConverter::EntidadeToUsuarioRecuperarDto);
        
        return pageUsuarioRecuperarDto;
    }

}