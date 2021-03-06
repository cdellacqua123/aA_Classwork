class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data('user-id');
        this.followState = this.$el.data('initial-follow-state');
        console.dir(this)
        this.render();
    }

    render() {
        if (!this.followState) {
            this.$el.prop('initial-follow-state');
            this.$el.html('Follow!')
        } else {
            this.$el.prop('initial-follow-state');
            this.$el.html('Unfollow!')
        }
    }
}

module.exports = FollowToggle;