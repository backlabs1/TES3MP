#ifndef GAME_MWVR_VRCAMERA_H
#define GAME_MWVR_VRCAMERA_H

#include <string>

#include <osg/ref_ptr>
#include <osg/Vec3>
#include <osg/Vec3d>
#include <osg/Quat>

#include "../mwrender/camera.hpp"

#include "vrtypes.hpp"

namespace MWVR
{
    /// \brief VR camera control
    class VRCamera : public MWRender::Camera
    {
    public:

        VRCamera(osg::Camera* camera);
        ~VRCamera() override;

        /// Update the view matrix of \a cam
         void updateCamera(osg::Camera* cam) override;

        /// Update the view matrix of the current camera
        void updateCamera() override;

        /// Reset to defaults
        void reset() override;

        /// Set where the camera is looking at. Uses Morrowind (euler) angles
        /// \param rot Rotation angles in radians
        void rotateCamera(float pitch, float roll, float yaw, bool adjust) override;

        float getRoll() const { return mRoll; }
        void setRoll(float angle);

        void toggleViewMode(bool force = false) override;

        bool toggleVanityMode(bool enable) override;
        void allowVanityMode(bool allow) override;

        /// Stores focal and camera world positions in passed arguments
        void getPosition(osg::Vec3d& focal, osg::Vec3d& camera) const override;

        /// Store camera orientation in passed arguments
        void getOrientation(osg::Quat& orientation) const override;

        void processViewChange() override;

        void rotateCameraToTrackingPtr() override;

        osg::Quat stageRotation();

        void rotateStage(float yaw) { mYawOffset += yaw; }

        void requestRecenter() { mShouldRecenter = true; }

        const osg::Vec3& headOffset() const { return mHeadOffset; }

        void setHeadOffset(const osg::Vec3& headOffset) { mHeadOffset = headOffset; }

    protected:
        void recenter();
        void applyTracking();
        void updateTracking();

    private:
        float mRoll = 0.f;
        Pose mHeadPose{};
        osg::Vec3 mHeadOffset{ 0,0,0 };
        bool mShouldRecenter{ true };
        bool mHasTrackingData{ false };
        float mYawOffset{ 0.f };
    };
}

#endif
