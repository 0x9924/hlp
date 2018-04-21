struct sockaddr_in {
     short            sin_family;   // e.g. AF_INET, AF_INET6
     unsigned short   sin_port;     // e.g. htons(3490)
     struct in_addr   sin_addr;     // see struct in_addr, below
     char             sin_zero[8];  // zero this if you want to
};


struct sockaddr_un {
     sa_family_t sun_family;      /* AF_UNIX */
     char        sun_path[108];   /* pathname */
};
