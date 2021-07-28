export const login = (user) => (
    $.ajax({
        method: 'POST',
        url: '/api/session',
        data: { user }
    })
);

export const signup = (user) => (
    $.ajax({
        url: 'api/user',
        method: 'POST',
        data: {user}
    })    
);


export const logout = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE'
    })
)