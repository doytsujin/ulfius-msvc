#include <ulfius/ulfius.h>

#define APP_PORT 8080

typedef const struct _u_request* request;
typedef struct _u_response* response;
typedef const char* c_char;

static void set_header(response r, c_char k, c_char v) { u_map_put(r->map_header, k, v); }
static void set_ct_html(response r) { set_header(r, "Content-Type", "text/html; charset=utf-8"); }
static void set_body(response r, c_char b) { ulfius_set_string_body_response(r, 200, b); }

int handle_index(request req, response res, void* user_data)
{
    set_ct_html(res);
    set_body(res, "hello, world!");
    return U_CALLBACK_CONTINUE;
}

int main()
{
    struct _u_instance server;

    if (ulfius_init_instance(&server, APP_PORT, NULL, NULL) != U_OK) {
        fprintf(stderr, "Error ulfius_init_instance, abort\n");
        return 1;
    }
    
    ulfius_add_endpoint_by_val(&server, "GET", "/", NULL, 0, &handle_index, NULL);

    if (ulfius_start_framework(&server) == U_OK) {
        printf("Start framework on port %d\n", server.port);
    }

    system("PAUSE");

    return 0;
}
