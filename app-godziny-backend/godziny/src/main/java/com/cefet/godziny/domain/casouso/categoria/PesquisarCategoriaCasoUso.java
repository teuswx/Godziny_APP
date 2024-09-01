package com.cefet.godziny.domain.casouso.categoria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.cefet.godziny.api.categoria.CategoriaRecuperarDto;
import com.cefet.godziny.constantes.usuario.EnumRecursos;
import com.cefet.godziny.infraestrutura.persistencia.categoria.CategoriaRepositorioJpa;
import com.cefet.godziny.infraestrutura.persistencia.usuario.UsuarioEntidade;
import com.cefet.godziny.infraestrutura.exceptions.UsuarioNaoAutorizadoException;
import com.cefet.godziny.infraestrutura.persistencia.categoria.CategoriaEntidade;
import com.cefet.godziny.infraestrutura.rest.categoria.CategoriaRestConverter;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@AllArgsConstructor
public class PesquisarCategoriaCasoUso {
    @Autowired
    private final CategoriaRepositorioJpa categoriaRepositorioJpa;

    @NotNull(message = "A sigla do curso é obrigatória")
    private String cursoSigla;

    @NotNull(message = "O nome da categoria é obrigatória")
    private String nome;
    
    public void validarPesquisa() throws Exception {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UsuarioEntidade userContext = (UsuarioEntidade) authentication.getPrincipal();
        if(!userContext.getTipo().equals(EnumRecursos.ADM)){
            throw new UsuarioNaoAutorizadoException();
        }
    }

    public Page<CategoriaRecuperarDto> pesquisarCategoria(Pageable pageable) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UsuarioEntidade admin = (UsuarioEntidade) authentication.getPrincipal();

        Specification<CategoriaEntidade> specification = Specification.where(null);

        if (cursoSigla != null) {
            specification = specification.and((root, query, criteriaBuilder) ->
                criteriaBuilder.like(criteriaBuilder.lower(root.get("curso").get("sigla")), "%" + cursoSigla.toLowerCase() + "%"));
        }
        if (nome != null) {
            specification = specification.and((root, query, criteriaBuilder) ->
                criteriaBuilder.like(root.get("nome"), "%" + nome + "%"));
        }

        specification = Specification.where((root, query, criteriaBuilder) ->
            criteriaBuilder.equal(root.get("curso").get("coordenador").get("matricula"), admin.getMatricula()));

        Page<CategoriaRecuperarDto> pageCategoriaRecuperarDto = categoriaRepositorioJpa.listCategorias(specification, pageable)
            .map(CategoriaRestConverter::EntidadeToCategoriaRecuperarDto);
        
        return pageCategoriaRecuperarDto;
    }
    
}