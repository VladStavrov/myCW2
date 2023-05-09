package com.example.buysell.models;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "user")
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String email;
    @Column(length = 1000)
    private String password;

    private String name;

    private boolean active;
    public boolean isAdmin(){
        return roles.contains(Role.ROLE_ADMIN);
    }
    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL,
            mappedBy = "user")
    private Favorites favorites;
    @ElementCollection(targetClass = Role.class,fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role",
    joinColumns =@JoinColumn(name="user_id") )
    @Enumerated(EnumType.STRING)
    private Set<Role > roles = new HashSet<>();

    /*@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,
            mappedBy = "user")
    private Set<OrderBuying > orderBuyings = new HashSet<>();
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,
            mappedBy = "user")
    private Set<OrderQuestion > orderQuestions = new HashSet<>();*/

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
        //sequrity
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }


    public Favorites getFavorites() {
        return favorites;
    }

    public void setFavorites(Favorites favorites) {
        this.favorites = favorites;
    }
}
